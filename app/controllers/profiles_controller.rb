class ProfilesController < ApplicationController
  before_action :authenticate_user!  # Avant chaque action, assurez-vous que l'utilisateur est authentifié.

  def show
    @user = current_user  # Récupérez l'utilisateur actuellement connecté.
    restrict_access unless current_user == @user
  end

  def edit
    @user = current_user  # Récupérez l'utilisateur actuellement connecté pour l'édition de son profil.
  end

  def update
    @user = current_user  # Récupérez l'utilisateur actuellement connecté pour la mise à jour de son profil.
    if @user.update(profile_params)  # Tentez de mettre à jour les informations du profil avec les paramètres autorisés.
      redirect_to profile_path, notice: "Profil mis à jour avec succès."  # Redirigez l'utilisateur vers la page de profil avec un message de succès.
    else
      render :edit  # Si la mise à jour échoue en raison de validations, affichez à nouveau le formulaire d'édition.
    end
  end

  private

  def restrict_access
    flash[:alert] = "Accès refusé. Vous ne pouvez pas accéder au profil d'un autre utilisateur."
    redirect_to root_path
  end

  def profile_params
    params.require(:user).permit(:email)  # Autorisez uniquement la mise à jour de l'adresse e-mail de l'utilisateur.
  end
end

