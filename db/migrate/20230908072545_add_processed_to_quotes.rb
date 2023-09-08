class AddProcessedToQuotes < ActiveRecord::Migration[7.0]
  def change
    add_column :quotes, :processed, :boolean
  end
end
