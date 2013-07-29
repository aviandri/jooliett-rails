class CreateMasterProductsProductSizes < ActiveRecord::Migration
  def change
    create_table :master_products_product_sizes do |t|
    	t.belongs_to :master_product
    	t.belongs_to :product_size
    end
  end
end
