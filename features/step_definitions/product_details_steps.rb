Given(/^I am in Product list page of category Dress$/) do  
  @category = FactoryGirl.create(:category, :name => "dress")  
  @product_image = FactoryGirl.create(:product_image, :primary => true)
  @product_image_2 = FactoryGirl.create(:product_image)
  @color = FactoryGirl.create(:color)
  @product_color = FactoryGirl.create(:product_color, :product_images => [@product_image, @product_image_2], :color => @color)
  @master_product = FactoryGirl.create(:master_product, :categories => [@category], :product_colors => [@product_color])

  @product_image_1 = FactoryGirl.create(:product_image)
  @product_color_1 = FactoryGirl.create(:product_color, :product_images => [@product_image_1], :color => @color)
  @master_product_discounted = FactoryGirl.create(:master_product, :discount_price => 100000, :discount_percentage => 15, :categories => [@category], :product_colors => [@product_color_1])       

  visit "/products/index/#{@category.name}"
end

When(/^I click on a product with name "(.*?)"$/) do |arg1|
  find(:xpath, "//a[@href='/products/#{@master_product.id}']").click
end

Then(/^I should see the detail of the product$/) do
  within ".prod-details" do
  	page.should have_content @master_product.name
  end
  within "#desc" do
  	page.should have_content @master_product.description
  end

  within ".price" do
  	page.should have_content @master_product.price
  end
  page.should have_xpath("//img[@src=\"#{@product_image.image.url}\"]")
  
  within '#mini-thumb' do
    page.all('li').count(2)
  end  

  within "#colors" do
    page.all('span').count(1)
  end

end

When(/^I click on a product with name "(.*?)" that is discounted$/) do |arg1| 
  find(:xpath, "//a[@href='/products/#{@master_product_discounted.id}']").click
end

Then(/^I should see the detail of the discounted product$/) do
  within ".discounted" do
  	page.should have_content @master_product_discounted.discount_price
  end

  within ".discount" do
  	page.should have_content @master_product_discounted.discount_percentage
  end

  within ".price" do
  	page.should have_content @master_product_discounted.price
  end  
  page.should have_xpath("//img[@src=\"#{@product_image_1.image.url}\"]")
end

