# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product_color do |color|
    color.product_images{[FactoryGirl.create(:product_image)]}
  end
end
