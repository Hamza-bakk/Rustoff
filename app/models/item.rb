class Item < ApplicationRecord
    # Validation : Assurez-vous que le titre est présent.
    validates :title, presence: true
    # Validation : Assurez-vous que la description est présente.
    validates :description, presence: true
    # Validation : Assurez-vous que le prix est présent.
    validates :price, presence: true
    # Validation : Assurez-vous que l'URL de l'image est présente et unique.
    validates :image_url, presence: true, uniqueness: true
    # Validation : Assurez-vous que le texte alternatif (alt) est présent.
    validates :alt, presence: true
    # Validation : Assurez-vous que la catégorie est présente.
    validates :category, presence: true
  
    # Relation : Un Item peut être présent dans de nombreux paniers (CartItems).
    has_many :cart_items, dependent: :destroy
    # Relation : Un Item peut être présent dans de nombreux éléments de commande (OrderItems).
    has_many :order_items
    # Relation : Si l'Item est supprimé, supprimez également tous les OrderItems associés.
    has_many :order_items, dependent: :destroy
  
    # Options de catégorie disponibles pour les Items.
    CATEGORY_OPTIONS = ['3D', 'Animation', 'Logo', 'Twitch', 'Merch', 'Tattoo', 'Illustrations', 'Avatars', 'Autres']
  
    # Utilisation d'une énumération pour gérer la catégorie.
    enum category_enum: CATEGORY_OPTIONS
  end
  
