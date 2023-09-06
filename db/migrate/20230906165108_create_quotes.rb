class CreateQuotes < ActiveRecord::Migration[7.0]
  def change
    create_table :quotes do |t|
      t.text :description
      t.string :person_name
      t.string :email
      t.integer :admin_id

      t.timestamps
    end
  end
end
