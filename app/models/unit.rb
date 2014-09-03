class Unit < ActiveRecord::Base
  has_many :ingredients_for_recipes

  validates :name, presence: true, uniqueness: true
end
