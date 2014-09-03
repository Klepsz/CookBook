class Ingredient < ActiveRecord::Base
  has_many :ingredient_for_recipes
  has_many :recipes, through: :ingredient_for_recipes

  validates :name, presence: true, uniqueness: true
end
