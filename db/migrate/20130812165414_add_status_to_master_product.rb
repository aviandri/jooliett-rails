class AddStatusToMasterProduct < ActiveRecord::Migration
  def change
    add_column :master_products, :status, :string
  end
end
