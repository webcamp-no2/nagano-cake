class ChangeNotNullOrderIdToOrderProducts < ActiveRecord::Migration[5.2]
  def change
    change_column_null :order_products, :order_id, false
  end
end
