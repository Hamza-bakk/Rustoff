class DashboardController < ApplicationController

  def index
    # Vous pouvez ajouter ici la logique de gestion de la page d'accueil du tableau de bord.
    # Par exemple, récupérer des données de la base de données.
  end

  def show
    # Vous pouvez ajouter ici la logique de gestion de la page d'accueil du tableau de bord.
    # Par exemple, récupérer des données de la base de données.
  end

  def store
    @item = Item.new
  end

  def users
    @users = User.all
  end
  
  # Vous pouvez ajouter d'autres actions de contrôleur ici en fonction de vos besoins.
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to dashboard_store_path, notice: "Le produit a été ajouté avec succès."
    else
      render 'store' # Si la sauvegarde échoue, redirigez l'utilisateur vers la vue "store" avec des erreurs.
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:title, :description, :price, :image_url, :alt)
  end
end
