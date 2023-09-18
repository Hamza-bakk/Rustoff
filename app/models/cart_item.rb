class CartItem < ApplicationRecord
  belongs_to :cart  # Relation : Un CartItem appartient à un Cart.
  belongs_to :item  # Relation : Un CartItem appartient à un Item.

  # Méthode qui calcule le prix total pour cet élément du panier.
  def total_price
    quantity * item.price  # La quantité de l'élément multipliée par le prix unitaire de l'Item.
  end
end
