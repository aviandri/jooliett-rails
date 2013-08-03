class RemoveCityFromShippingDetail < ActiveRecord::Migration
  def change
  	remove_column :shipping_details, :city
  end
end
