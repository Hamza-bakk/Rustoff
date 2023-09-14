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

  def orders
    start_date = params[:start_date]
    end_date = params[:end_date]
    
    # Filtrez les commandes en fonction des dates fournies
    @orders = Order.where(created_at: start_date..end_date)
  end


  def products
    @items = Item.all
  end

  def quotes
    @quotes = Quote.all
    @unprocessed_quotes = Quote.where(processed: false)
    @processed_quotes = Quote.where(processed: true)
    render 'dashboard/quotes'
  end
  

  def users
    @users = User.all
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to dashboard_store_path, notice: "Le produit a été ajouté avec succès."
    else
      render 'store'
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:title, :description, :price, :image_url, :alt, :category)
  end
end
