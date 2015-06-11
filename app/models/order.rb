class Order < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  def friendly_created_at
    created_at.strftime("%b %d, %Y")
  end

end
