class Cover < ActiveRecord::Base
	mount_uploader :image, CoverUploader

	scope :active, -> {where("status" => "active")}


	def url
		image.desktop
	end

	def mobile
		image.mobile
	end

end
