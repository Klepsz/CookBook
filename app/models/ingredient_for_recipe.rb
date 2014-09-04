class IngredientForRecipe < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :recipe
  belongs_to :unit

  validates :amount, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0, less_than:1000 }
  validates :ingredient_id, uniqueness: { scope: :recipe_id }

  def name
    ingredient.name
  end

  def amount_with_unit
    "#{amount} #{unit.name}"
  end

end
