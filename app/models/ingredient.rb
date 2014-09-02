class Ingredient < ActiveRecord::Base
  has_many :ingredient_for_recipes
  has_many :recipes, through: :ingredient_for_recipes
  
end
