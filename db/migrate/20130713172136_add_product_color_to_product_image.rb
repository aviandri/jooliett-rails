class AddProductColorToProductImage < ActiveRecord::Migration
  def change
    add_column :product_images, :product_color_id, :integer
  end
end
