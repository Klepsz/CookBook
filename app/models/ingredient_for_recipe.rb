class IngredientForRecipe < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :recipe
  belongs_to :unit

  validates :amount, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0, less_than:1000 }
end
