class AddPriceToShippingDetails < ActiveRecord::Migration
  def change
    add_column :shipping_details, :price, :integer, :default => 1
  end
end
