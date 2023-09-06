class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :item

  def total_price
    quantity * item.price
  end

  
end
