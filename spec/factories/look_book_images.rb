# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :look_book_image do |look_book_image|
    look_book_image.image{File.open(Rails.root + 'spec/fixtures/images/img.jpg')}
  end
end
