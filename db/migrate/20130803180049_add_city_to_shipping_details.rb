class AddCityToShippingDetails < ActiveRecord::Migration
  def change
  	add_column :shipping_details, :city_id, :integer
  end
end
