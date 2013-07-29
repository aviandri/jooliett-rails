class CreateProductImages < ActiveRecord::Migration
  def change
    create_table :product_images do |t|
      t.string :image
      t.boolean :primary

      t.timestamps
    end
  end
end
