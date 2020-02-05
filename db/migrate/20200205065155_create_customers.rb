class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :kana_last_name, null: false
      t.string :kana_first_name, null: false
      t.string :password, null: false
      t.string :email, null: false
      t.string :address, null: false
      t.string :zip_code, null: false
      t.string :tel, null: false
      t.boolean :admittion_status, null: false,default: 1

      t.timestamps
    end
  end
end
