class AddInvoiceCodeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :invoice_code, :string
  end
end
