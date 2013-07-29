class LookBooksController < ApplicationController
  def index
	@look_books = LookBook.all  	
  end

  def show
  	@look_book = LookBook.find(params[:id])
  	@look_books = LookBook.all
  end
end
