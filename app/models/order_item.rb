class OrderItem < ApplicationRecord
  # Relation : Un OrderItem appartient à une commande (Order).
  belongs_to :order
  # Relation : Un OrderItem appartient à un article (Item).
  belongs_to :item
end

