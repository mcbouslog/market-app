class CartedProduct < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true
  validates :quantity, numericality: { greater_than: 0 , only_integer: true }
  
  SALES_TAX = 0.09

  def calc_subtotal
    quantity * product.price
  end

end
