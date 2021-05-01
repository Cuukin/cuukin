class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :validatable, :confirmable, :trackable, :lockable,
         :omniauthable, omniauth_providers: %i[facebook]

  has_one_attached :photo

  has_many :lesson_validations, dependent: :destroy
  has_many :lesson_unblocks, dependent: :destroy
  has_many :user_awards, dependent: :destroy
  has_many :user_badges, dependent: :destroy
  has_many :user_recipes, dependent: :destroy
  has_many :user_skills, dependent: :destroy
  has_many :grocery_lists, dependent: :destroy

  has_many :skill_chapters, through: :user_skills
  has_many :badges, through: :user_badges
  has_many :awards, through: :user_awards

  enum level: [ "dishwasher", "newbie", "chef in progress", "chef of party", "sous chef", "master chef" ]

  validates :first_name, presence: true
  validates :username, uniqueness: true
  validates :terms_of_service, acceptance: true

  after_create :set_username
  after_create :welcome_currencies
  after_create :give_welcome_badge
  after_create :create_grocery_list

  before_update :check_username_presence

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  private

  def create_grocery_list
    list = GroceryList.new(user: self)
    list.save
  end

  def create_username
    # Method to generate a random username
    nouns = %w( Happy Crazy Amazing Cool Lovely Cheery Glorious )
    foods = %w( Carrot Potato Spinach Garlic Broccoli Zucchini Mushroom )
    "#{nouns.sample}#{foods.sample}#{rand(1..10000)}"
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

  def check_username_presence
    # Checks if user has a username, in case user edits profile and assigns an empty string as username
    # If user doesn't have username, then calls set username function
    # Method is called whenever user updates profile
    set_username if !(self.username) || self.username == ""
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
