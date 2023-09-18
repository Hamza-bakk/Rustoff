require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    # Créer un nouvel utilisateur avec des attributs valides
    user = User.new(
      email: "john@example.com",
      encrypted_password: "your_encrypted_password_here", # Remplacez par le vrai hash de mot de passe
      password: "password123" # Spécifiez un mot de passe ici
    )
    # S'attendre à ce que l'utilisateur soit valide
    expect(user).to be_valid
  end

  it "is not valid without a unique email" do
    # Créer un utilisateur existant avec un email déjà utilisé
    existing_user = User.create(
      email: "john@example.com",
      encrypted_password: "your_encrypted_password_here"
    )
    # Créer un nouvel utilisateur avec le même email
    user = User.new(
      email: "john@example.com",
      encrypted_password: "another_encrypted_password_here" # Utilisez un autre mot de passe si nécessaire
    )
    # S'attendre à ce que l'utilisateur ne soit pas valide
    expect(user).to_not be_valid
  end
    #Gestion de vérification création compte 
  it "is not valid without an email" do
    # Créer un utilisateur sans email
    user = User.new(encrypted_password: "your_encrypted_password_here")
    # S'attendre à ce que l'utilisateur ne soit pas valide
    expect(user).to_not be_valid
  end
end
