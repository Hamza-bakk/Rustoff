class Quote < ApplicationRecord

  # Validation : Assurez-vous que les éléments avec validates sont présents
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :description, presence: true
  validates :category, presence: true

  CATEGORY_OPTIONS = ['3D', 'Animation', 'Logo', 'Twitch', 'Merch', 'Tattoo', 'Design divers', 'Avatars', 'Autres']

  enum category_enum: CATEGORY_OPTIONS
  
end
