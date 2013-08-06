ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "jooliett.com",
  :user_name            => "cs@jooliett.com",
  :password             => "jooliettasoy",
  :authentication       => "plain",
  :enable_starttls_auto => true
}