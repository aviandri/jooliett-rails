class CreateLookBooks < ActiveRecord::Migration
  def change
    create_table :look_books do |t|
      t.string :image

      t.timestamps
    end
  end
end
