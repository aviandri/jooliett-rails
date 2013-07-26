class CreateLookBookImages < ActiveRecord::Migration
  def change
    create_table :look_book_images do |t|
      t.string :image
      t.integer :look_book_id

      t.timestamps
    end
  end
end
