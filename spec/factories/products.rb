FactoryGirl.define do
  factory :product do |product|
  	master_product  	
  	product_size
  	product_color
  	product.quantity 1
  end
end
	