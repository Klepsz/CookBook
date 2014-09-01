class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :ingredients
      t.text :description
      t.text :directions
      t.integer :servings
      t.integer :user_id
      t.boolean :vegan

      t.timestamps
    end
  end
end
