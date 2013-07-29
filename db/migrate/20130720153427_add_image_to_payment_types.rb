class AddImageToPaymentTypes < ActiveRecord::Migration
  def change
  	add_column :payment_types, :image, :string
  end
end
