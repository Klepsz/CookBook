module RecipesHelper
  def show_ingredient(ingredient_for_recipe)
    "#{ingredient_for_recipe.name} #{ingredient_for_recipe.amount_with_unit}"  
  end
end
