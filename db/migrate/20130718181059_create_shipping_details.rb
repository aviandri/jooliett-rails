class CreateShippingDetails < ActiveRecord::Migration
  def change
    create_table :shipping_details do |t|
      t.string :name
      t.string :mobile
      t.string :country
      t.string :address1
      t.string :address2
      t.string :city
      t.string :postal_code

      t.timestamps
    end
  end
end
