class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :validatable, :confirmable, :trackable, :lockable

  has_one_attached :photo

  validates :first_name, :last_name, presence: true
  validates :username, uniqueness: true

  after_create :set_username
  before_update :check_username_presence
  after_create :async_set_avatar

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  private

  def create_username
    nouns = %w( Happy Crazy Amazing Cool Lovely Cheery Glorious )
    foods = %w( Carrot Potato Spinach Garlic Broccoli Zucchini Mushroom )
    "#{nouns.sample}#{foods.sample}#{rand(1..10000)}"
  end

  def set_username
    new_username = create_username
    User.find_by(username: new_username) ? set_username : self.username = new_username
  end

  def check_username_presence
    set_username if !(self.username) || self.username == ""
  end

  def async_set_avatar
    SetAvatarJob.perform_later(self)
  end
end
