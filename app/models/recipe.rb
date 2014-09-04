class Recipe < ActiveRecord::Base

  acts_as_taggable

  has_attached_file :picture, :styles => { :medium => "400x400>", :thumb => "150x150>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  has_many :ingredient_for_recipes, dependent: :destroy
  has_many :ingredients, through: :ingredient_for_recipes

  validates :name, presence: true, uniqueness: true, length: { maximum: 80 }
  validates :description, presence: true
  validates :directions, presence: true

  def self.tagged_or_all(tag=nil)
    recipes = tagged_with tag
    recipes = all if recipes.blank?
    recipes
  end
end
