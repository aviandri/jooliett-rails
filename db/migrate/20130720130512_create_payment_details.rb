class CreatePaymentDetails < ActiveRecord::Migration
  def change
    create_table :payment_details do |t|
      t.integer :payment_type_id
      t.integer :user_id

      t.timestamps
    end
  end
end
