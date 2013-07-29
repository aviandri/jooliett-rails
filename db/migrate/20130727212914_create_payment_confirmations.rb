class CreatePaymentConfirmations < ActiveRecord::Migration
  def change
    create_table :payment_confirmations do |t|
      t.string :invoice_code
      t.string :account_holder
      t.string :bank_name
      t.integer :amount

      t.timestamps
    end
  end
end
