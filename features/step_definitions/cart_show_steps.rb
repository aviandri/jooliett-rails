Given(/^I have a products in my Cart$/) do
	@master_product = FactoryGirl.create(:master_product, :price => 200000, :discount_price => 150000, :discount_percentage => 15)
	@master_product_2 = FactoryGirl.create(:master_product, :price => 250000)
	@product_image = FactoryGirl.create(:product_image)
	@product_image_2 = FactoryGirl.create(:product_image)
	@product_color = FactoryGirl.create(:product_color, :product_images => [@product_image])
	@product_color_2 = FactoryGirl.create(:product_color, :product_images => [@product_image_2])
	@product = FactoryGirl.create(:product, :product_color => @product_color, :master_product => @master_product)
	@product_2 = FactoryGirl.create(:product, :product_color => @product_color_2, :master_product => @master_product_2)
	@cart = FactoryGirl.create(:cart, :products => [@product, @product_2])
  
end

When(/^I visit '\/carts\/\{id\}'$/) do
  	visit "/carts/#{@cart.id}"
end

Then(/^I should see product details in my cart$/) do
  page.should have_content "Your Shopping Cart"
  within "table" do
  	page.all('td.row').count.should eq(2)
  	page.should have_content @master_product.name
  	page.should have_content @master_product.discount_price
  	page.should have_content @master_product.discount_percentage

  	page.should have_content @master_product_2.name
  	page.should have_content @master_product_2.price

  	page.should have_content (@master_product.discount_price + @master_product_2.price)

  end

end

When(/^I click on "(.*?)"$/) do |arg1|
  find(:xpath, "(//a[text()='Remove Item'])[1]").click
end

Then(/^I should see that a product is removed from my Cart$/) do
  within "table" do
  	page.all('td.row').count.should eq(1)
  end
end
