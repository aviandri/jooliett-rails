class AddMasterProductIdToProduct < ActiveRecord::Migration
  def change
  	add_column :products, :master_product_id, :integer
  end
end
