class AddMasterProductIdAndCategoryIdToCategoriesMasterProducts < ActiveRecord::Migration
  def change
  	add_column :categories_master_products, :master_product_id, :integer
  	add_column :categories_master_products, :category_id, :integer
  end
end
