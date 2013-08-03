class State < ActiveRecord::Base
	has_many :cities, dependent: :destroy, :autosave => true
end
