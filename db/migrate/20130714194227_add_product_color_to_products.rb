class AddProductColorToProducts < ActiveRecord::Migration
  def change
    add_column :products, :product_color_id, :integer
  end
end
