class CartedProduct < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  belongs_to :order

  SALES_TAX = 0.09

  def calc_subtotal
    quantity * product.price
  end

end
