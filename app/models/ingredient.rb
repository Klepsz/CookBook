class Ingredient < ActiveRecord::Base
  has_many :ingredient_for_recipes
  has_many :recipes, through: :ingredient_for_recipes

  validates :name, presence: true, uniqueness: true

  before_destroy :ingredient_in_use

  protected
  def ingredient_in_use
    recipes.empty?
  end
end
