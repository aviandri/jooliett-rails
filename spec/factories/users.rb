# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :user do
  	name "aviandri"
  	password "password01"
  	sequence :email do |n|
    	"email#{n}@factory.com"
  	end
  end
end
