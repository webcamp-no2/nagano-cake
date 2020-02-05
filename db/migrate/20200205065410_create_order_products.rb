class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.integer :product_id, null: false
      t.integer :count, null: false
      t.integer :ordered_price, null: false
      t.integer :production_status, null: false,default: 0

      t.timestamps
    end
  end
end
