class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :validatable, :confirmable, :trackable

  has_one_attached :photo

  validates :first_name, :last_name, presence: true
  validates :username, uniqueness: true

  after_create :set_username, :set_avatar
  before_update :check_username_presence

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

  def randomize_avatar
    av1 = "https://res.cloudinary.com/cuukin/image/upload/v1610757107/Cuukin%20-%20Avatar/ck_av_9_bllcye.png"
    av2 = "https://res.cloudinary.com/cuukin/image/upload/v1610757107/Cuukin%20-%20Avatar/ck_av_8_k6jxvr.png"
    av3 = "https://res.cloudinary.com/cuukin/image/upload/v1610757107/Cuukin%20-%20Avatar/ck_av_7_dkpysc.png"
    av4 = "https://res.cloudinary.com/cuukin/image/upload/v1610757106/Cuukin%20-%20Avatar/ck_av_5_cjcneu.png"
    av5 = "https://res.cloudinary.com/cuukin/image/upload/v1610757107/Cuukin%20-%20Avatar/ck_av_10_q5t9ky.png"
    av6 = "https://res.cloudinary.com/cuukin/image/upload/v1610757107/Cuukin%20-%20Avatar/ck_av_12_pyotlq.png"
    [av1, av2, av3, av4, av5, av6].sample
  end

  def set_avatar
    require "open-uri"
    new_avatar = URI.open("#{randomize_avatar}")
    self.photo.attach(io: new_avatar, filename: 'avatar.png', content_type: 'image/png')
  end
end
