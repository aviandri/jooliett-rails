FactoryGirl.define do
	factory :master_product do |master_product|
		master_product.name "Dress"
		master_product.description "Description"
		master_product.price 150000
		master_product.categories{[FactoryGirl.create(:category)]}		
		master_product.product_colors{[FactoryGirl.create(:product_color)]}
	end	
end