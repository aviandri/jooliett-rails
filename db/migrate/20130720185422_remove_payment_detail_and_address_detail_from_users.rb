class RemovePaymentDetailAndAddressDetailFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :shipping_detail_id
  	remove_column :users, :payment_detail_id
  end
end
