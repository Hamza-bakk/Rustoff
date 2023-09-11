class AddDisabledToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :disabled, :boolean
  end
end
