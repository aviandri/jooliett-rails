class AddDescription2ToPaymentTypes < ActiveRecord::Migration
  def change
    add_column :payment_types, :description2, :string
  end
end
