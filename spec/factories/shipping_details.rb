# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :shipping_detail do
    name "MyString"
    mobile "+82111111"
    country "MyString"
    address1 "MyString"
    address2 "MyString"
    city "MyString"
    postal_code "45555"
  end
end
