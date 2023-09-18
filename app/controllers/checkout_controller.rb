class CheckoutController < ApplicationController
  
  def create
    
    #Cette partie permet de créer le paiement stripe a travers l'API
    
    @total = params[:total].to_d
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [
        {
          price_data: {
            currency: 'eur',
            unit_amount: (@total*100).to_i,
            product_data: {
              name: 'Rails Stripe Checkout',
            },
          },
          quantity: 1
        },
      ],
      mode: 'payment',
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url
    )
    redirect_to @session.url, allow_other_host: true
  end
  
  def success

    # Après avoir obtenu les informations de paiement depuis Stripe, vous pouvez enregistrer la commande
    # Vous devez personnaliser cette logique en fonction de votre modèle de commande
    #Succès est transité vers orders show afin de créer l'ID order après paiement ainsi sécurisé la base de données    
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
    
    # Par exemple, si vous avez un modèle de commande nommé Order :
    @order = Order.new(
      user_id: current_user.id, # Assurez-vous que l'utilisateur est connecté
      total_price: @total, # Remplacez cela par le montant total de la commande
      # Autres attributs de commande que vous souhaitez enregistrer
    )
    
    if @order.save
      # Enregistrez les détails de la commande (par exemple, les articles commandés) ici
      # Assurez-vous d'ajuster cette logique en fonction de votre modèle de commande et de panier
      
      # Exemple fictif pour ajouter un article à la commande (à adapter à votre modèle) :
      CartItem.where(cart_id: current_user.cart.id).each do |cart_item|
        @order.order_items.create(
          item_id: cart_item.item_id,
          quantity: cart_item.quantity,
          unit_price: cart_item.item.price # Utilisez l'attribut unit_price pour stocker le prix de l'article
        )
      end
      
      
      # Videz le panier de l'utilisateur après avoir enregistré la commande
      current_user.cart.cart_items.destroy_all
      
      # Redirigez l'utilisateur vers une page de confirmation de commande
      redirect_to order_path(@order)
    else
      # La sauvegarde de la commande a échoué, gérez l'erreur en conséquence
      flash[:error] = 'La commande n\'a pas pu être enregistrée.'
      redirect_to root_path
    end
  end
  
  def cancel
  end
end
