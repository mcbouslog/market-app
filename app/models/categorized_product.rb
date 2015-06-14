class CategorizedProduct < ActiveRecord::Base
  has_many :products
  has_many :categories

end
