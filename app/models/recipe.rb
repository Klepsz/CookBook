class Recipe < ActiveRecord::Base
  acts_as_taggable

  has_many :ingredient_for_recipes, dependent: :destroy
  has_many :ingredients, through: :ingredient_for_recipes

  validates :name, presence: true, uniqueness: true, length: { maximum: 80 }
  validates :description, presence: true
  validates :directions, presence: true
end
