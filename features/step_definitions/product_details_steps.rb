Given(/^I am in Product list page of category Dress$/) do  
  @category = FactoryGirl.create(:category, :name => "dress")
  @master_product = FactoryGirl.create(:master_product, :categories => [@category])
  product1 = FactoryGirl.create(:product, :primary => true)
  @master_product.products << product1

  @master_product_discounted = FactoryGirl.create(:master_product, :discount_price => 100000, :discount_percentage => 15, :categories => [@category])     
  product2 = FactoryGirl.create(:product, :primary => true)
  @master_product_discounted.products << product2

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

  within ".prod-price-details" do
  	page.should have_content @master_product.price
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
end

