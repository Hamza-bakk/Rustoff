class User < ApplicationRecord
  after_create :welcome_send
  after_create :create_cart
  has_one_attached :avatar

  #Gérer par GEM DEVISE 
  def create_cart
    Cart.create(user: self) #Permt de créer un panier aprés au même moment que l'inscription
  end

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :orders, dependent: :destroy
  has_one :cart, dependent: :destroy
end
