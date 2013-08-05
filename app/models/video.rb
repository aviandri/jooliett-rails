class Video < ActiveRecord::Base
	mount_uploader :image, CoverUploader
end
