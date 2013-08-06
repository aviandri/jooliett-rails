class AddAccountNumberToPaymentConfirmations < ActiveRecord::Migration
  def change
    add_column :payment_confirmations, :account_number, :string
  end
end
