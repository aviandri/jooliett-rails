class Cover < ActiveRecord::Base
	mount_uploader :image, CoverUploader

	scope :active, -> {where("status" => "active")}

	scope :sort_by_updated_at, order("updated_at")


	def url
		image.desktop
	end

	def mobile
		image.mobile
	end

	def default
		image.desktop
	end

end
