class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]
  
  # GET /orders or /orders.json
  def index
    @orders = current_user.orders.order(created_at: :desc)
    @num_orders = current_user.orders.count  
  end
  
  
  
  # GET /orders/1 or /orders/1.json
  def show
    @orders = current_user.orders.order(created_at: :desc)
    @order = Order.find(params[:id])
    
  end
  

  # GET /orders/new
  def new
    @order = Order.new
  end
  
  # GET /orders/1/edit
  def edit
  end
  
  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)
    
    respond_to do |format|
      if @order.save
        format.html { redirect_to order_url(@order), notice: "La commande a été créée avec succès." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "La commande a été mise à jour avec succès." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy
    
    respond_to do |format|
      format.html { redirect_to orders_url, notice: "La commande a été détruite avec succès." }
      format.json { head :no_content }
    end
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end
  
  # Only allow a list of trusted parameters through.
  def order_params
    params.require(:order).permit(:user_id, :total_price)
  end
  
  private
  
  def set_cart_total
    # Accédez au contrôleur CartsController pour obtenir le total du panier
    carts_controller = CartsController.new
    # Ma logique pour obtenir le total du panier, par exemple :
    @cart = current_user.cart
    @cart_total = @cart.total_price
  end
end
