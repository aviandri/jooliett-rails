Given(/^I am on Jooliett site$/) do
	@cover = FactoryGirl.create(:cover)
	@cover2 = FactoryGirl.create(:cover)
end

When(/^I visit the index page$/) do
	visit "/"  
end

Then(/^I should see jooliett cover page$/) do
  
end