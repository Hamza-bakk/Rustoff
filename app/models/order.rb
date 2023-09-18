class Order < ApplicationRecord
  # Relation : Une commande (Order) appartient à un utilisateur (User).
  belongs_to :user
  # Relation : Une commande (Order) peut avoir de nombreux éléments de commande (OrderItems).
  has_many :order_items, dependent: :destroy
  # Relation : Une commande (Order) peut avoir de nombreux articles (Items) à travers les éléments de commande (OrderItems).
  has_many :items, through: :order_items

  # Méthode qui calcule le prix total de la commande.
  def total_price
    order_items.sum { |order_item| order_item.unit_price * order_item.quantity }
    # La méthode `sum` calcule la somme des prix unitaires multipliés par les quantités de tous les éléments de commande dans la commande.
  end
end

