ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "jooliett.com",
  :user_name            => "aviandri",
  :password             => "skyw4lk3r",
  :authentication       => "plain",
  :enable_starttls_auto => true
}