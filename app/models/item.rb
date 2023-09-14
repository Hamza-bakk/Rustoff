class Item < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true
    validates :price, presence: true
    validates :image_url, presence: true, uniqueness: true
    validates :alt, presence: true
    validates :category, presence: true

    
    has_many :cart_items, dependent: :destroy
    has_many :order_items
    has_many :order_items, dependent: :destroy

    CATEGORY_OPTIONS = ['3D', 'Animation', 'Logo', 'Twitch', 'Merch', 'Tattoo', 'Illustrations', 'Avatars', 'Autres']

    enum category_enum: CATEGORY_OPTIONS


end
