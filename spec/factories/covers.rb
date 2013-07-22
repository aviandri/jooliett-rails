# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cover do |cover|
    cover.caption "MyString"    
    cover.status "active"
    cover.image{File.open(Rails.root+ 'spec/fixtures/images/photo-slide01.jpg')}
  end
end
