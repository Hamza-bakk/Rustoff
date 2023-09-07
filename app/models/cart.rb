class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items

  def total_price
    total = 0
    cart_items.each do |item|
      total += item.total_price
    end
    total
  end

end
