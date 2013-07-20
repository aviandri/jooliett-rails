class CreatePaymentTypes < ActiveRecord::Migration
  def change
    create_table :payment_types do |t|
      t.string :name
      t.string :type
      t.string :description

      t.timestamps
    end
  end
end
