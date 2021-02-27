class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :validatable, :confirmable, :trackable, :lockable,
         :omniauthable, omniauth_providers: %i[facebook]

  has_one_attached :photo

  has_many :lesson_validations, dependent: :destroy

  enum level: [ "dishwasher", "newbie", "chef in progress", "chef of party", "sous chef", "master chef" ]

  validates :first_name, presence: true
  validates :username, uniqueness: true

  after_create :set_username
  after_create :welcome_currencies
  # after_create :async_set_avatar

  before_update :check_username_presence

  after_touch :lesson_validation_currencies
  # after_touch :update_user_level

  def name
    self.last_name ? "#{self.first_name.capitalize} #{self.last_name.capitalize}" : "#{self.first_name.capitalize}"
  end

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.photo # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      user.skip_confirmation!
    end
  end

  private

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

  # def async_set_avatar
    # Calls background job to set avatar when user creates profile
    # SetAvatarJob.perform_later(self)
  # end

  def lesson_validation_currencies
    if self.lesson_validations.last.validated
      self.xp += self.lesson_validations.last.lesson.xp
      self.save
    else
      self.cuukies -= 5
      self.save
    end
  end

  # def update_user_level
  #   unless self.lesson_validations.empty?
  #     if self.lesson_validations.last.lesson.book.level != self.level
  #       last_book = Book.find_by(level: self.level)
  #       last_book_xp = last_book.xp
  #       self.xp += last_book_xp
  #       self.level = self.lesson_validations.last.lesson.book.level
  #       self.save
  #     end
  #   end
  # end

  def welcome_currencies
    # Unless user hasn't validated any lessons yet, then it adds to user cuukies
    # the xp value of the last lesson validated, then saves to DB
    # Method is called whenever a new lesson validation is created
    # unless self.lesson_validations.empty?
    #   self.cuukies += self.lesson_validations.last.lesson.xp
    #   self.save
    # end

    # MVP - user gains 20 cuukies when signs up and in no other circumstance
    self.cuukies = 20
    self.xp = 100
    self.level = "newbie"
    self.save
  end
end
