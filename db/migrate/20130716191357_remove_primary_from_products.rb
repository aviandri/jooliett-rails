class RemovePrimaryFromProducts < ActiveRecord::Migration
  def change
  	remove_column :products, :primary
  end
end
