class CartsController < ApplicationController
  before_action :set_cart, only: %i[ show edit update destroy ]
  
  # GET /carts or /carts.json
  def index
    @carts = Cart.all
  end
  
  # GET /carts/1 or /carts/1.json
  def show
    @user = current_user
    @cart = current_user.cart # Assurez-vous que current_user renvoie l'utilisateur connecté
    @cart_items = @cart.cart_items if @cart.present?
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
      
      # Créez un nouvel élément dans le panier
      @cart_item = @cart.cart_items.create(item: @item, quantity: params[:quantity])
      
    else
      redirect_to cart_path(@cart), notice: "L'élément a été ajouté au panier."
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
      format.html { redirect_to cart_path(@cart), notice: "Item was successfully removed from the cart." }
      format.json { head :no_content }
    end
  end
  
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cart
    @cart = User.find(params[:id])
  end
  
  # Only allow a list of trusted parameters through.
  def cart_params
    params.require(:cart).permit(:user_id)
  end
end
