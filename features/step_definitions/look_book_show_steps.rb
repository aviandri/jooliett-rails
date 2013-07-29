require 'pry'
def create_look_books
	# @product_image = FactoryGirl.create(:product_image)
	# @product_color = FactoryGirl.create(:product_color, product_images: [@product_image] )
	@master_product = FactoryGirl.create(:master_product)
	@master_product_2 = FactoryGirl.create(:master_product)
	@master_product_3 = FactoryGirl.create(:master_product)
	@master_product_4 = FactoryGirl.create(:master_product)
	@master_product_5 = FactoryGirl.create(:master_product)

	@look_book_image = FactoryGirl.create(:look_book_image)
	@look_book_image_2 = FactoryGirl.create(:look_book_image)
	@look_book = FactoryGirl.create(:look_book, 
		look_book_images: [@look_book_image, @look_book_image_2], 
		name: "Look Book Name", description: "Description",
		master_products: [@master_product, @master_product_2, @master_product_3, @master_product_4, @master_product_5])
end

Given(/^I am on the look book index page$/) do
  create_look_books
  visit '/look_books'
end

When(/^I click on the first look book image$/) do
  find(:xpath, "//a[@href='/look_books/#{@look_book.id}']").click	
end

Then(/^I should see the look book details$/) do
  # page.should have_content @look_book.name
  within '#nowMM' do
  	page.all('li.active').count.should eq(2)
  end
  within '#nowMM .carousel-inner' do
  	page.all('img').count.should eq(2)
  end
  page.should have_content @look_book.name
  page.should have_content @look_book.description

  page.all('.prod').count.should eq(5)

  page.should have_content @master_product.name
  page.should have_content @master_product.sales_price

  page.should have_content @master_product_2.name
  page.should have_content @master_product_2.sales_price

end