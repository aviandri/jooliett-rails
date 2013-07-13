FactoryGirl.define do
  factory :product do |product|
  	master_product
  	product.image{File.open(Rails.root + 'spec/fixtures/images/img.jpg')}
  end
end
	