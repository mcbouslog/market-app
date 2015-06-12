class Order < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  SALES_TAX = 0.09

  def friendly_created_at
    created_at.strftime("%b %d, %Y")
  end

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
