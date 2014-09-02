class CreateIngredientForRecipes < ActiveRecord::Migration
  def change
    create_table :ingredient_for_recipes do |t|
      t.integer :ingredient_id
      t.integer :recipe_id
      t.integer :unit_id
      t.decimal :amount, precision: 5, scale: 2

      t.timestamps
    end
  end
end
