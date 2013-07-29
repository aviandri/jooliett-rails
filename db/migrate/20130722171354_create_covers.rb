class CreateCovers < ActiveRecord::Migration
  def change
    create_table :covers do |t|
      t.string :caption
      t.string :image
      t.string :status

      t.timestamps
    end
  end
end
