class Product < ActiveRecord::Base
  belongs_to :supplier
  has_many :product_images
  has_many :orders
  has_many :categorized_products
  has_many :categories, through: :categorized_products
  has_many :carted_products
  has_many :users, through: :carted_products

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: true
  validates :description, presence: true

  SALES_TAX = 0.09

  def friendly_updated_at
    updated_at.strftime("%b %d, %Y")
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
