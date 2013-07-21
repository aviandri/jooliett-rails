class CreatePaymentCodes < ActiveRecord::Migration
  def change
    create_table :payment_codes do |t|

      t.timestamps
    end
  end
end
