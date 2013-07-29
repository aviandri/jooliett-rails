# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product_image do |product_image|
    product_image.image{File.open(Rails.root + 'spec/fixtures/images/img.jpg')}
    primary false
  end
end
