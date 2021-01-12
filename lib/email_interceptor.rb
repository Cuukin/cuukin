class EmailInterceptor
  # safety net for development - test emails not sent to users
  def self.delivering_mail(message)
    message.subject = "#{message.to} #{message.subject}"
    message.to = ['cuukin.app@gmail.com']
  end
end
