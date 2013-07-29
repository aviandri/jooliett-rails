require 'pry'
Given(/^I am in Product list page of category Dress$/) do  
  @category = FactoryGirl.create(:category, :name => "dress")  
  @product_image = FactoryGirl.create(:product_image, :primary => true)
  @product_image_2 = FactoryGirl.create(:product_image)
  @color = FactoryGirl.create(:color)
  @product_color = FactoryGirl.create(:product_color, :product_images => [@product_image, @product_image_2], :color => @color)
  @master_product = FactoryGirl.create(:master_product, :categories => [@category], :product_colors => [@product_color])
  @product = FactoryGirl.create(:product, :product_color_id => @product_color.id, :master_product_id => @master_product.id, :quantity => 2)
  @product_2 = FactoryGirl.create(:product, :product_color_id => @product_color.id, :master_product_id => @master_product.id, :quantity => 2)

  @product_image_1 = FactoryGirl.create(:product_image)
  @product_color_1 = FactoryGirl.create(:product_color, :product_images => [@product_image_1], :color => @color)
  @master_product_discounted = FactoryGirl.create(:master_product, :discount_price => 100000, :discount_percentage => 15, :categories => [@category], :product_colors => [@product_color_1])       

  visit "/products/category/#{@category.name}"
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
  
  within 'ul.prod-minithumb' do
    page.all('li').count(2)
  end  

  within "div.color-tag" do
    page.all('span').count(1)
  end

  within "div.size-tag" do
    page.should have_content(@product.product_size.name)
    page.should have_content(@product_2.product_size.name)
    page.should have_css("span.size-tag", :count => 2)
  end

  within 'div.prod-related' do
    page.should have_css("div.prod2-meta", :count => 2)
    page.should have_content @master_product.price
    page.should have_content @master_product_discounted.price
    page.should have_content @master_product.name
    page.should have_content @master_product_discounted.name
  end    

  page.should have_xpath("//span[@data-color-id=\'#{@product_color.id}\']")

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


When(/^I click on a product with name "(.*?)" that is out of stock$/) do |arg1|
  @product.quantity = 0
  @product_2.quantity = 0
  @product.save
  @product_2.save
  find(:xpath, "//a[@href='/products/#{@master_product.id}']").click
end

Then(/^I should see the detail of out of stocked product$/) do
  within "span.outstock" do
    page.should have_content "OUT OF STOCK"
  end
end



