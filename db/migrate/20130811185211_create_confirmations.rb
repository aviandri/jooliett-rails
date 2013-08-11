class CreateConfirmations < ActiveRecord::Migration
  def change
    create_table :confirmations do |t|
      t.integer :order_id
      t.integer :jne_code

      t.timestamps
    end
  end
end
