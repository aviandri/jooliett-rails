class AddNameAndDesriptionToLookBooks < ActiveRecord::Migration
  def change
    add_column :look_books, :name, :string
    add_column :look_books, :description, :string
  end
end
