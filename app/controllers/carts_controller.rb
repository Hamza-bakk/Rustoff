class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart, only: %i[ show edit update destroy ]
  
  # GET /carts or /carts.json
  def index
    @carts = Cart.all
  end
  
  # GET /carts/1 or /carts/1.json
  def show
    @user = current_user
    @cart = Cart.find_or_create_by(user: current_user)
    @cart_items = @cart.cart_items
    @cart_total = @cart.total_price
  end
  
  def get_cart_total
    @cart = current_user.cart
    @cart_total = @cart.total_price
  end
  
  
  # GET /carts/new
  def new
    @cart = Cart.new
  end
  
  # GET /carts/1/edit
  def edit
  end
  
  # POST /carts or /carts.json
  def create
    # Assurez-vous que l'utilisateur est connecté
    if user_signed_in?
      # Récupérez le panier de l'utilisateur actuel ou créez-en un s'il n'en a pas
      @cart = current_user.cart || current_user.create_cart
      
      # Récupérez l'élément à ajouter au panier
      @item = Item.find(params[:item_id]) # Assurez-vous que le paramètre :item_id est correctement passé
      
      # Utilisez directement params[:quantity] pour obtenir la quantité
      quantity = params[:quantity].to_i
      
      # Créez un nouvel élément dans le panier avec la quantité spécifiée
      @cart_item = @cart.cart_items.create(item: @item, quantity: quantity)
      
      # Redirigez l'utilisateur vers la page du panier
      redirect_to cart_path(@cart), notice: "L'élément a été ajouté au panier."
    else
      # Gérez le cas où l'utilisateur n'est pas connecté
      redirect_to items_path, alert: "Vous devez être connecté pour ajouter des articles au panier."
    end
  end
  
  
  # PATCH/PUT /carts/1 or /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html do
          @cart.cart_items.each do |cart_item|
            cart_item.update(total_price: cart_item.quantity * cart_item.item.price)
          end
          redirect_to cart_url(@cart), notice: "Le panier a été mis à jour avec succès."
        end
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /carts/1 or /carts/1.json
  
  def destroy_item
    @cart = Cart.find(params[:id])
    @cart_item = @cart.cart_items.find(params[:cart_item_id])
    @cart_item.destroy
    
    respond_to do |format|
      format.html { redirect_to cart_path(@cart), notice: "L'article a été supprimé du panier avec succès." }
      format.json { head :no_content }
    end
  end
  
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cart
    @cart = find_cart(params[:user_id], params[:cart_id])
  end
  
  # Only allow a list of trusted parameters through.
  def cart_params
    params.require(:cart).permit(:user_id)
  end
  
  
  def find_cart(user_id, cart_id)
    if user_id
      user = User.find(user_id)
      @cart = user.cart
    elsif cart_id
      @cart = Cart.find(cart_id)
    else
      # Gérer le cas où ni l'ID d'utilisateur ni l'ID de panier n'est présent
      # Par exemple, rediriger vers une page d'erreur ou effectuer une action appropriée.
    end
  end
end