class RemovePriceFromShippingDetails < ActiveRecord::Migration
  def change
  	remove_column :shipping_details, :price
  end
end
