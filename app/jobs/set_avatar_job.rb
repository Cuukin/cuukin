class SetAvatarJob < ApplicationJob
  queue_as :default

  def randomize_avatar
    av1 = "https://res.cloudinary.com/cuukin/image/upload/v1610757107/Cuukin%20-%20Avatar/ck_av_9_bllcye.png"
    av2 = "https://res.cloudinary.com/cuukin/image/upload/v1610757107/Cuukin%20-%20Avatar/ck_av_8_k6jxvr.png"
    av3 = "https://res.cloudinary.com/cuukin/image/upload/v1610757107/Cuukin%20-%20Avatar/ck_av_7_dkpysc.png"
    av4 = "https://res.cloudinary.com/cuukin/image/upload/v1610757106/Cuukin%20-%20Avatar/ck_av_5_cjcneu.png"
    av5 = "https://res.cloudinary.com/cuukin/image/upload/v1610757107/Cuukin%20-%20Avatar/ck_av_10_q5t9ky.png"
    av6 = "https://res.cloudinary.com/cuukin/image/upload/v1610757107/Cuukin%20-%20Avatar/ck_av_12_pyotlq.png"
    [av1, av2, av3, av4, av5, av6].sample
  end

  def perform(user)
    require "open-uri"
    new_avatar = URI.open("#{randomize_avatar}")
    user.photo.attach(io: new_avatar, filename: 'avatar.png', content_type: 'image/png')
  end
end
