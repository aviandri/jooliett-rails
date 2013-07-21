class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :shipping_detail_id
      t.integer :payment_detail_id
      t.integer :user_id

      t.timestamps
    end
  end
end
