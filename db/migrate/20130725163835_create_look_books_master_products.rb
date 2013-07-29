class CreateLookBooksMasterProducts < ActiveRecord::Migration
  def change
    create_table :look_books_master_products do |t|
      t.integer :look_book_id
      t.integer :master_product_id
    end
  end
end
