class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :mark, :destroy]
  before_action :authenticate_user!

  def new
    @quote = Quote.new
  end

  def create
    category_label = params[:quote][:category]  
    category = Category.find_or_create_by(label: category_label) 
    @quote = Quote.new(quote_params)
    @quote.category = category.label
  
    if @quote.save
      redirect_to new_quote_path, notice: 'Devis créé avec succès.'
    else
      render :new
    end
  end

  def mark
    @quote.update(processed: params[:checked])
    redirect_to dashboard_quotes_path, notice: 'État du devis mis à jour avec succès.'
  end

  def reprocess
    quote = Quote.find(params[:id])
    quote.update(processed: false)
    redirect_to dashboard_quotes_path, notice: 'État du devis mis à jour avec succès.'
  end

  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy
    redirect_to dashboard_quotes_path, notice: 'Devis supprimé avec succès.'
  end

  def show
  end

  private

  def set_quote
    @quote = Quote.find(params[:id])
  end


  def quote_params
    params.require(:quote).permit(:first_name, :last_name, :email, :description, :category)
  end
end

