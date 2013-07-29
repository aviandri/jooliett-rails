class CreateMasterProductsCategories < ActiveRecord::Migration
  def change
    create_table :master_products_categories do |t|
    	t.belongs_to :categories
    	t.belongs_to :master_products
    end
  end
end
