class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.decimal :total_price, precision: 8, scale: 2
      t.decimal :tax, precision: 8, scale: 2
      t.decimal :subtotal, precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end
