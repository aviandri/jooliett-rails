Given(/^I am in Jooliett site$/) do
  	visit '/'
end

When(/^I click on "(.*?)" at the menu bar$/) do |arg1|
  @category = FactoryGirl.create(:category, :name => "dress")
	@master_product = FactoryGirl.create(:master_product, :categories => [@category])
  @product_1 = FactoryGirl.create(:product, :primary => true)
  @product_2 = FactoryGirl.create(:product)
  @master_product.products << @product_1
  @master_product.products << @product_2

  click_link arg1

end

Then(/^I should see products with category dress$/) do
	 within ".sub-navbar" do
	 	within ".container" do
	 		page.should have_content @master_product.categories.first.name
	 	end	
	 end
end

Then(/^I should see "(.*?)" dress item with name "(.*?)", price "(.*?)" and Photo URL "(.*?)"$/) do |arg1, arg2, arg3, arg4|
  	page.should have_css(".prod", :count => 1)
  	within ".prod-title" do
  		page.should have_content @master_product.name
  	end

  	within ".prod-price" do
  		page.should have_content @master_product.price
  	end


    page.should have_xpath("//img[@src=\"#{@product_1.image.medium.url}\"]")
  	
end

