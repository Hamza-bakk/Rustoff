class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items



  def total_price
    order_items.sum { |order_item| order_item.unit_price * order_item.quantity }
  end
  
end
