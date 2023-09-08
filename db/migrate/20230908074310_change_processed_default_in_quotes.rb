class ChangeProcessedDefaultInQuotes < ActiveRecord::Migration[6.0]
  def change
    change_column_default :quotes, :processed, from: nil, to: false
  end
end