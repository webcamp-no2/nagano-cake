class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.string :payment_method, null: false
      t.integer :status, null: false,default: 0
      t.string :zip_code, null: false
      t.string :delivery_address, null: false
      t.string :delivery_name, null: false
      t.integer :postage, null: false, default: 800
      t.integer :payment, null: false

      t.timestamps
    end
  end
end
