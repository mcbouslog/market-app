class Product < ActiveRecord::Base
  belongs_to :supplier
  has_many :product_images

  SALES_TAX = 0.09

  def friendly_updated_at
    updated_at.strftime("%B, %d, %y")
  end

  def sales_message
    if price.to_f <= 2 
      "Discount Item!"
    else
      "On Sale!"
    end
  end

  def sales_tax
    sales_tax = price.to_f * SALES_TAX
    sales_tax.round(2)
  end

  def total
    total = price.to_f + sales_tax.round(2)
  end

end
