class AddPrimaryToProductColor < ActiveRecord::Migration
  def change
  	add_column :product_colors, :primary, :boolean
  end
end
