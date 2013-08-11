class JooliettMailer < ActionMailer::Base
  default from: "from@example.com"
  JOOLIETT_EMAIL = "cs@jooliett.com"


  def purchase_confirmation(order)
  	@order = order
  	mail(:to => order.user.email , :subject => "Thank you for purchasing", :from => "cs@jooliett.com", :content_type => "text/html")
  end

  def purchase_confirmation_admin(order)
  	@order = order
  	mail(:to => JooliettMailer::JOOLIETT_EMAIL , :subject => "Ada Yang Pesen nih Sis", :from => "cs@jooliett.com", :content_type => "text/html", :template_name => "purchase_confirmation")
  end

  def confirm_order(confirmation)
  	@confirmation = confirmation
  	mail(:to => @confirmation.order.user.email , :subject => "We have recived your payment", :from => "cs@jooliett.com", :content_type => "text/html")
  	
  end

  def confirm_order_admin(confirmation)
  	@confirmation = confirmation
  	mail(:to => JooliettMailer::JOOLIETT_EMAIL , :subject => "Ada Yang Confirm nih Sis", :from => "cs@jooliett.com", :content_type => "text/html", :template_name => "confirm_order")
  end
end
