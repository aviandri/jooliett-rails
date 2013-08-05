class AddTextColorToColor < ActiveRecord::Migration
  def change
  	add_column :colors, :text_color, :string
  end
end
