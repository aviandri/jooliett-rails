require 'spec_helper'
require 'pry'

describe Category do
  before(:each) do
  	@category = FactoryGirl.create(:category, :name => "dress")
  end

  describe "find by name" do
  	it "should return a category with name dress" do
  		Category.where(name: "dress").should include(@category)
  	end
  end

  describe "categories_except_new_arrival" do
  	before(:each) do
  	  	@new_arrival = FactoryGirl.create(:category, :name => "new-arrival")
  	  	@tops = FactoryGirl.create(:category, :name => "tops")
  	end
    it "should give all categories except new arrival" do
      	Category.categories_except_new_arrival.count.should eq(2)	
    end
  end
end
