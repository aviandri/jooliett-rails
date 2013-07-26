class LookBook < ActiveRecord::Base
	has_and_belongs_to_many :master_products
	has_many :look_book_images

end
