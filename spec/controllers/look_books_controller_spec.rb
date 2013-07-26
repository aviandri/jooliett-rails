require 'spec_helper'

describe LookBooksController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success      
      assigns(:look_books).should_not be_nil 
    end
  end

  describe "GET 'show'" do
  	before(:each) do
  	  @look_book_image = FactoryGirl.create(:look_book_image) 
  	  @look_book = FactoryGirl.create(:look_book, look_book_images: [@look_book_image] )
  	end
    it "should return http success" do
    	get 'show', id: @look_book.id
      	response.should be_success
      	assigns(:look_book).should_not be_nil
      	assigns(:look_books).should_not be_nil
    end
  end

end
