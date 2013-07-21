class AddPaymentCodeToPaymentDetails < ActiveRecord::Migration
  def change
    add_column :payment_details, :payment_code_id, :integer
  end
end
