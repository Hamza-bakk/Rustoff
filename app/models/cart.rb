class Cart < ApplicationRecord
  belongs_to :user  # Relation : Un panier (Cart) appartient à un utilisateur (User).
  has_many :cart_items, dependent: :destroy  # Relation : Un panier a de nombreux CartItems, et si le panier est supprimé, les CartItems associés sont également supprimés.
  has_many :items, through: :cart_items  # Relation : Un panier a de nombreux Items à travers les CartItems associés.

  # Méthode qui calcule le prix total de tous les éléments dans le panier.
  def total_price
    total = 0
    cart_items.each do |item|
      total += item.total_price
    end
    total
  end
end

