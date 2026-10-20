class CreateProducts < ActiveRecord::Migration[8.1]
  def change
    create_table :products do |t|
      t.string :name
      t.date :expires_on
      t.integer :quantity

      t.timestamps
    end
  end
end
