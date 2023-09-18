class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]
  
  #La def destroy et create et edit concerne le coté admin qui peut avoir la gestion des items 
  def destroy
    @item.destroy
    redirect_to dashboard_products_path, notice: "L'objet a été détruit avec succès."
  end
  
  # GET /items or /items.json
  def index
    @items = Item.all
  end
  
  # GET /items/1 or /items/1.json
  def show
    @item = Item.find(params[:id])
  end
  
  # GET /items/new
  def new
    @item = Item.new
  end
  
  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
    @categories = Item.distinct.pluck(:category)
  end
  
  # POST /items or /items.json
  def create
    @item = Item.new(item_params)
    
    respond_to do |format|
      if @item.save
        format.html { redirect_to item_url(@item), notice: "L'élément a été créé avec succès." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PATCH/PUT /items/1 or /items/1.json
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to dashboard_products_path, notice: "Article mis à jour avec succès."
    else
      render :edit
    end
  end
  
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end
  
  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(:title, :description, :price, :image, :alt, :category)
  end
end
