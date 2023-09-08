class UpdateQuotesTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :quotes, :person_name, :string
    add_column :quotes, :first_name, :string
    add_column :quotes, :last_name, :string
    add_column :quotes, :category, :string
  end
end





