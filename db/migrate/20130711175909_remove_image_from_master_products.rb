class RemoveImageFromMasterProducts < ActiveRecord::Migration
  def change
  	remove_column :master_products, :image
  end
end
