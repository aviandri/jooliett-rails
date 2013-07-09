require 'spec_helper'

describe Category do
  before(:each) do
  	@category = FactoryGirl.create(:category)
  end

  describe "find by name" do
  	it "should return a category with name dress" do
  		Category.where(name: "dress").should include(@category)
  	end
  end
end
