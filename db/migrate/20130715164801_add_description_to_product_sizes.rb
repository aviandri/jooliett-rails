class AddDescriptionToProductSizes < ActiveRecord::Migration
  def change
    add_column :product_sizes, :description, :string
  end
end
