class QuotesController < ApplicationController
  before_action :set_quote, only: [:show]

  # Action pour afficher le formulaire de création de devis
  def new
    @quote = Quote.new
  end

  # Action pour créer un devis
  def create
    @quote = Quote.new(quote_params)
    if @quote.save
      redirect_to @quote, notice: 'Devis créé avec succès.'
    else
      render :new
    end
  end

  # Action pour afficher les détails d'un devis
  def show
  end

  private

  def set_quote
    @quote = Quote.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:description, :person_name, :email, :admin_id)
  end
end

