class CreateMasterProducts < ActiveRecord::Migration
  def change
    create_table :master_products do |t|
      t.string :name
      t.integer :price
      t.string :description
      t.integer :discount_price
      t.string :discount_percentage

      t.timestamps
    end
  end
end
