ActionMailer::Base.smtp_settings = {
  :address              => "smtp.mailgun.org",
  :port                 => 587,
  :domain               => ENV['domain'],
  :user_name            => ENV['username'],
  :password             => ENV['password'],
  :authentication       => "plain",
}