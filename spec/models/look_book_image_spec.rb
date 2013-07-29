require 'spec_helper'

describe LookBookImage do
 	before(:each) do
 		@look_book_image = FactoryGirl.create(:look_book_image)
 	end

 	describe "valid" do
 	  it "should be valid" do
 	    @look_book_image.image.should_not be_nil
 	    @look_book_image.image.url.should_not be_nil
 	    @look_book_image.image.medium.url.should_not be_nil
 	  end
 	end
end
