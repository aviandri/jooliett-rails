# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :payment_type do
    name "MyString"
    type ""
    description "MyString"
    image "western-union-straight-32px.png"
  end
end
