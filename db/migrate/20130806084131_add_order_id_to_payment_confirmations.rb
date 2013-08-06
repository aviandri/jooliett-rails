class AddOrderIdToPaymentConfirmations < ActiveRecord::Migration
  def change
  	add_column :payment_confirmations, :order_id, :integer
  end
end
