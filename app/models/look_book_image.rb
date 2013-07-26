class LookBookImage < ActiveRecord::Base
	belongs_to :look_book
	mount_uploader :image, LookBookImageUploader

end
