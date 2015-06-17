class CartedProduct < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  belongs_to :order

  SALES_TAX = 0.09

  def calc_subtotal(price)
    quantity * price
  end

  def calc_tax(price)
    quantity * price * SALES_TAX
  end

  def calc_total(price)
    quantity * price * (SALES_TAX + 1)
  end

end
