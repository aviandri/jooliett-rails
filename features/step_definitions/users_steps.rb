Given(/^I am on the sign in page$/) do
  visit '/users/sign_in'
end

When(/^I click the Continue Checkout Button$/) do
  find("#continue-checkout").click()
end

Then(/^I should user registration form$/) do
  # page.should have_content "About Customer"
end