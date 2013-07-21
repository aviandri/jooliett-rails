class AddPrice2ShippingDetails < ActiveRecord::Migration
  def change
  	add_column :shipping_details, :price, :integer, :default => 0
  end
end
