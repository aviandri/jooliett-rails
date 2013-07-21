require 'pry'

def create_user
	 @visitor ||= { :name => "Testy McUserton", :email => "example@example.com",
    :password => "changeme", :password_confirmation => "changeme" }
     FactoryGirl.create(:user, @visitor)
end

def sign_in
	visit '/users/sign_out'
	create_user
	visit '/users/sign_in'
	fill_in "user_email", :with => @visitor[:email]
  	fill_in "user_password", :with => @visitor[:password]
  	click_button "Sign in"
end

def initialize_payment_methods
	@payment_type1 = FactoryGirl.create(:payment_type, name: "Transfer BCA", 
						description: "<span>Bank BCA KCP Wolter Mongisidi a/n Jooliett</span><br>
                    				  <span>No. Rek.: 564 231 8777</span>",
                    	image: "visa-straight-32px" )
	@payment_type2 = FactoryGirl.create(:payment_type, name: "Transfer Mandiri", 
						description: "<span>Bank Mandiri a/n Jooliett</span><br>
                    				  <span>No. Rek.: 564 231 8777</span>",
                    	image: "visa-straight-32px" )
end

Given(/^I am on payment method selection list$/) do	
  initialize_payment_methods	
  sign_in
  @order = FactoryGirl.create(:order)
  visit "/orders/#{@order.id}/payment_details/new"
end

When(/^I choose payment method and click next step$/) do
  	within "ul.select-payment2" do
  		page.should have_content @payment_type1.name
  		page.should have_content "Bank BCA KCP Wolter Mongisidi a/n Jooliett"

  		page.should have_content @payment_type2.name
  		page.should have_content "Bank Mandiri a/n Jooliett"
  	end
  	click_button "Next Step"

end

Then(/^I should be redirected to summary page$/) do
	# page.should have_content "Order Summary"  
end