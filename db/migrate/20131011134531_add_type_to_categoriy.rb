class AddTypeToCategoriy < ActiveRecord::Migration
  def change
    add_column :categoriys, :type, :string
  end
end
