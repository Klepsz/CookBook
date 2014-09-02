class Recipe < ActiveRecord::Base
  acts_as_taggable

  # has_many :ingredient_for_recipes

  # has_many :ingredients, :through => :ingredient_for_recipes
end
