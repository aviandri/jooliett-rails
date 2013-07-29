class AddImageToMasterProduct < ActiveRecord::Migration
  def change
  	add_column :master_products, :image, :string
  end
end
