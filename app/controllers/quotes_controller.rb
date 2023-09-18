class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :mark, :destroy]  # Avant certaines actions, exécutez la méthode `set_quote` pour configurer l'objet @quote.
  before_action :authenticate_user!  # Avant chaque action, assurez-vous que l'utilisateur est authentifié.

  def new
    @quote = Quote.new  # Créez une nouvelle instance de Quote pour le formulaire de création.
  end

  def create
    category_label = params[:quote][:category]  
    category = Category.find_or_create_by(label: category_label)  # Recherchez ou créez une catégorie en fonction du libellé reçu du formulaire.
    @quote = Quote.new(quote_params)  # Créez un nouvel objet Quote avec les paramètres du formulaire.
    @quote.category = category.label  # Définissez la catégorie pour l'objet Quote.

    if @quote.save  # Tentez de sauvegarder le devis.
      redirect_to new_quote_path, notice: 'Devis créé avec succès.'  # Redirigez vers la page de création avec un message de succès.
    else
      render :new  # Si la création échoue en raison de validations, affichez à nouveau le formulaire de création.
    end
  end

  def mark
    @quote.update(processed: params[:checked])  # Mettez à jour l'état du devis en fonction de la valeur de `params[:checked]`.
    redirect_to dashboard_quotes_path, notice: 'État du devis mis à jour avec succès.'  # Redirigez vers le tableau de bord avec un message de succès.
  end

  def reprocess
    quote = Quote.find(params[:id])  # Recherchez le devis par son identifiant.
    quote.update(processed: false)  # Réinitialisez l'état du devis à non traité.
    redirect_to dashboard_quotes_path, notice: 'État du devis mis à jour avec succès.'  # Redirigez vers le tableau de bord avec un message de succès.
  end

  def destroy
    @quote = Quote.find(params[:id])  # Recherchez le devis par son identifiant.
    @quote.destroy  # Supprimez le devis.
    redirect_to dashboard_quotes_path, notice: 'Devis supprimé avec succès.'  # Redirigez vers le tableau de bord avec un message de succès.
  end

  def show
    # Cette action est généralement utilisée pour afficher les détails d'un devis, mais elle semble être vide dans votre exemple.
  end

  private

  def set_quote
    @quote = Quote.find(params[:id])  # Recherchez un devis par son identifiant pour les actions spécifiques où cela est nécessaire.
  end

  def quote_params
    params.require(:quote).permit(:first_name, :last_name, :email, :description, :category)  # Autorisez les paramètres spécifiques du formulaire pour la création d'un devis.
  end
end
