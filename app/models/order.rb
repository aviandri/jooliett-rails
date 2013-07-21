class Order < ActiveRecord::Base
	belongs_to :shipping_detail
	belongs_to :payment_detail
	belongs_to :user

	has_many :order_items, dependent: :destroy, :autosave => true
end
