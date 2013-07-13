class Color < ActiveRecord::Base
	validates :name, :hex, :presence => true
end
