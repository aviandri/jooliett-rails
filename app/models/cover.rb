class Cover < ActiveRecord::Base
	mount_uploader :image, CoverUploader

	scope :active, -> {where("status" => "active")}

end
