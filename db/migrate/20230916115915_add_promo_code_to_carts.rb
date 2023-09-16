class AddPromoCodeToCarts < ActiveRecord::Migration[7.0]
  def change
    add_reference :carts, :promo_code, foreign_key: true
  end
end