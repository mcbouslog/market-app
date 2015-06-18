class Order < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  has_many :carted_products

  SALES_TAX = 0.09

  def friendly_created_at
    created_at.strftime("%b %d, %Y")
  end

  def calculate_totals
    subtotal = 0
    carted_products.each do |carted_product|
      subtotal += carted_product.calc_subtotal
    end

    tax = subtotal * SALES_TAX
    total_price = subtotal + tax
    update(subtotal: subtotal, tax: tax, total_price: total_price)
  end

end
