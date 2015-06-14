class ChangePriceToDecimalInProducts < ActiveRecord::Migration
  def change
    change_column :products, :price, 'decimal USING CAST(column_name AS decimal)', precision: 8, scale: 2
  end
end
