require 'spec_helper'

describe LookBook do
	before(:each) do
  		@look_book = FactoryGirl.create(:look_book)
	end

  describe "master products" do
  	
    it "should have many master products" do
      	@look_book.master_products.should_not be_nil
    end
  end

  describe "look book images" do
    it "should have many lookbook images" do
    	@look_book.look_book_images.should_not be_nil     
    end
  end

  describe "description and name" do
    it "should have description and name" do
      	@look_book.name.should be_nil
      	@look_book.description.should be_nil
    end
  end
end
