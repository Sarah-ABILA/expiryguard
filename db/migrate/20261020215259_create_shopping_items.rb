class CreateShoppingItems < ActiveRecord::Migration[8.1]
  def change
    create_table :shopping_items do |t|
      t.string :name

      t.timestamps
    end
  end
end
