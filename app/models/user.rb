class User < ApplicationRecord
  extend FriendlyId
  friendly_id :username, use: :slugged

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :validatable, :confirmable, :trackable, :lockable,
         :omniauthable, omniauth_providers: %i[facebook twitter google_oauth2]

  has_one_attached :photo

  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
  has_many :following, through: :following_relationships, source: :following

  has_many :lesson_validations, dependent: :destroy
  has_many :lesson_unblocks, dependent: :destroy
  has_many :user_awards, dependent: :destroy
  has_many :user_badges, dependent: :destroy
  has_many :user_recipes, dependent: :destroy
  has_many :user_skills, dependent: :destroy
  has_many :grocery_lists, dependent: :destroy
  has_many :user_sign_ins, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  has_many :quiz_results, dependent: :destroy

  has_many :skill_chapters, through: :user_skills
  has_many :badges, through: :user_badges
  has_many :awards, through: :user_awards

  enum level: [ "dishwasher", "newbie", "chef in progress", "chef of party", "sous chef", "master chef" ]

  validates :first_name, presence: true
  validates :username, uniqueness: true, length: { maximum: 16, message: "shouldn't be longer than 15 characters" }
  validates :terms_of_service, acceptance: true

  after_create :set_username
  after_create :welcome_currencies
  after_create :give_welcome_badge
  after_create :create_grocery_list

  before_update :check_username_presence
  before_update :check_profile_completed

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.first_name = auth.info.name   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      user.skip_confirmation!
    end
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def follow(user_id)
    following_relationships.create(following_id: user_id)
  end

  def unfollow(user_id)
    following_relationships.find_by(following_id: user_id).destroy
  end

  def is_following?(user_id)
    relationship = Follow.find_by(follower_id: id, following_id: user_id)
    return true if relationship
  end

  private

  def should_generate_new_friendly_id?
    username_changed?
  end

  def create_grocery_list
    list = GroceryList.new(user: self)
    list.save
  end

  def create_username
    # Method to generate a random username
    nouns = %w( Happy Crazy Juicy Cool Cheery Glorious )
    foods = %w( Mango Kiwi Onion Lemon Peach Chili Basil )
    "#{nouns.sample}#{foods.sample}#{rand(1..99)}"
  end

  def set_username
    new_username = create_username
    # Checks if username is already on DB
    # If it is, then starts method again creating new username
    # If it isn't, then asign user username to it and save to DB
    # Method is called whenever a user is created
    User.find_by(username: new_username) ? set_username : self.username = new_username
    self.save
  end

  def username_pattern
    self.username = self.username.gsub(" ", "_")
    self.save
  end

  def check_username_presence
    # Checks if user has a username, in case user edits profile and assigns an empty string as username
    # If user doesn't have username, then calls set username function
    # Method is called whenever user updates profile
    if !(self.username) || self.username == "" || self.username == " "
      set_username
    elsif self.username.split("").include?(" ")
      username_pattern
    end
  end

  def check_profile_completed
    if !self.profile_completed
      if self.last_name? && self.last_name != "" && self.bio? && self.bio != "" && self.residence_country? && self.residence_country != "" && self.relationship_status? && self.relationship_status != "" && self.occupation? && self.occupation != ""
        self.cuukies += 2
        self.profile_completed = true
        self.save
      end
    end
  end

  def welcome_currencies
    # MVP - user gains 20 cuukies when signs up and in no other circumstance
    self.cuukies = 20
    self.xp = 100
    self.level = "newbie"
    self.save
  end

  def give_welcome_badge
    UserAward.create(user: self, award: Award.find_by(name: 'Oh hi there!'))
  end
end
