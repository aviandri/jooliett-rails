Given(/^I am on Jooliett site$/) do
	@cover = FactoryGirl.create(:cover)
	@cover2 = FactoryGirl.create(:cover)
end

When(/^I visit the index page$/) do
	visit "/"  
end

Then(/^I should see jooliett cover page$/) do
  	page.should have_css("#myCarousel")
  	within ".carousel-indicators" do
  		page.all('li').count.should eq(2)
  		page.all('li.active').count.should eq(1)
  	end
  	within ".carousel-inner" do
  		page.all('.item').count.should eq(2)
  		page.all('.active').count.should eq(1)
  	end
  	
end