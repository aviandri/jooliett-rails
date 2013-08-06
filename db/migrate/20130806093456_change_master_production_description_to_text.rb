class ChangeMasterProductionDescriptionToText < ActiveRecord::Migration
  def change
  	change_column :master_products, :description, :text
  end
end
