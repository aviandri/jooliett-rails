require 'pry'
def create_user
	 @visitor ||= { :name => "Testy McUserton", :email => "example@example.com",
    :password => "changeme", :password_confirmation => "changeme" }
     FactoryGirl.create(:user, @visitor)
end

def sign_in
	page.driver.submit :delete, "/users/sign_out", {}
	create_user
	visit '/users/sign_in'
	fill_in "user_email", :with => @visitor[:email]
  	fill_in "user_password", :with => @visitor[:password]
  	click_button "Sign in"
end

Given(/^I am on new shipping details page$/) do
  sign_in
  visit '/shipping_details/new'
end

When(/^I fill in the form and click action$/) do
  fill_in "shipping_detail_name", with: "Aviandri"
  fill_in "shipping_detail_mobile", with: "0821111111"
  fill_in "shipping_detail_address1", with: "Jl.Casablanca Mansion"
  fill_in "shipping_detail_address2", with: "Belakang Kota Kasablanka"
  fill_in "shipping_detail_city", with: "Jakarta Selatan"
  fill_in "shipping_detail_postal_code", with: "40559"
  click_button "Next Step"
end

Then(/^I should be redirected to payment page$/) do
  page.should have_content "Payment Methods"
end