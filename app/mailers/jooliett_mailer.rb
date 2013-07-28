class JooliettMailer < ActionMailer::Base
  default from: "from@example.com"

  def purchase_confirmation
  	mail(:to => "aviandri@gmail.com", :subject => "registered", :from => "aviandri@jooliett.com", :content_type => "text/html")
  end
end
