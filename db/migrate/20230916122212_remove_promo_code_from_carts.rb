class RemovePromoCodeFromCarts < ActiveRecord::Migration[7.0]
  def change
    remove_reference :carts, :promo_code, foreign_key: true
  end
end