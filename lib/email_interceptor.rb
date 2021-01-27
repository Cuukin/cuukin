class EmailInterceptor
  def self.delivering_email(message)
    message.subject = "#{message.subject}"
    message.to = [ 'frdrc.julia@gmail.com' ]
  end
end
