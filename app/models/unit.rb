class Unit < ActiveRecord::Base
  has_many :ingredients_for_recipes
end
