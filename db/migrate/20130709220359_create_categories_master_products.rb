class CreateCategoriesMasterProducts < ActiveRecord::Migration
  def change
    create_table :categories_master_products do |t|
    	t.belongs_to :categories
    	t.belongs_to :master_products
    end
  end
end
