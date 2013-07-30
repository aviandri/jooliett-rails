class JooliettMailer < ActionMailer::Base
  default from: "from@example.com"

  def purchase_confirmation(order)
  	@order = order
  	binding.pry
  	mail(:to => order.user.email , :subject => "Thank you for purchasing", :from => "cs@jooliett.com", :content_type => "text/html")

  end
end
