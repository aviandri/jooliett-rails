class AddPrimaryFlagtoProduct < ActiveRecord::Migration
  def change
  	add_column :products, :primary, :boolean
  end
end
