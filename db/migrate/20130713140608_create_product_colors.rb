class CreateProductColors < ActiveRecord::Migration
  def change
    create_table :product_colors do |t|
      t.integer :color_id
      t.integer :master_product_id

      t.timestamps
    end
  end
end
