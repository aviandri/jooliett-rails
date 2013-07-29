# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :order do
    shipping_detail
    payment_detail
    user
    invoice_code SecureRandom.hex(10)
  end
end
