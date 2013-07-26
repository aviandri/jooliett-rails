def create_look_books
	@look_book_image = FactoryGirl.create(:look_book_image)
	@look_book = FactoryGirl.create(:look_book, look_book_images: [@look_book_image])
end
Given(/^I am on Jooliett home$/) do
	create_look_books
	visit '/'  
end

When(/^I click on "(.*?)" link$/) do |arg1|
  	click_link arg1
end

Then(/^I should the lookbook index page$/) do
  	page.all('.mm-cover').count.should eq(1)
end