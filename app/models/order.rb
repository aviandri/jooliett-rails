class Order < ActiveRecord::Base
	belongs_to :shipping_detail, dependent: :destroy, :autosave => true
	belongs_to :payment_detail, dependent: :destroy, :autosave => true
	belongs_to :user

	has_many :order_items, dependent: :destroy, :autosave => true
end
