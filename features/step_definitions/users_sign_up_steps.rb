Given(/^I am on the sign up page$/) do
  visit '/users/sign_up'
end

When(/^I fill in form and click next step$/) do
	fill_in "user_name", :with => "Aviandri"
	fill_in "user_email", :with => "aviandri@gmail.com"
	fill_in "user_password", :with => "password01"
	find("button", :text => /\ANext Step\z/).click
  
end

Then(/^I should be redirected to cover page$/) do
  	page.should	have_content "cover"
end