require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  test "tagged_or_all should return all when tag is blank" do
    recipes = Recipe.all
    assert_equal recipes, recipes.tagged_or_all("") 
  end

  test "tagged_or_all should return all when tag is nil" do
     recipes = Recipe.all
     assert_equal recipes, recipes.tagged_or_all
  end

  test "tagged_or_all should return tagged properly when tag is present" do
     assert false, "NAPISZ TESTY ŁOBUZIE"
  end
end