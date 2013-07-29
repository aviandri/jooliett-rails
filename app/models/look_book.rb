class LookBook < ActiveRecord::Base
	has_and_belongs_to_many :master_products
	has_many :look_book_images
	accepts_nested_attributes_for :look_book_images
end
