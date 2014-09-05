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
    recipes = Recipe.all
    assert_equal 0, Recipe.count
    recipe = Recipe.create(name: "Pizza", description: "Very very tasty", directions: "directions",
                          servings: 4, vegan: false, user_id: 1)
    recipe.tag_list.add "Classic"
    recipe.save
    assert_equal [recipe], recipes.tagged_or_all("Classic")
  end

  test "tagged_or_all return proper tag from among others tags" do
    recipes = Recipe.all
    recipe1 = Recipe.create(name: "Pizza1", description: "Very very tasty", directions: "directions",
                          servings: 4, vegan: false, user_id: 1)
    recipe1.tag_list.add "Classic"
    recipe1.save
    recipe2 = Recipe.create(name: "Pizza2", description: "Very very tasty", directions: "directions",
                          servings: 4, vegan: false, user_id: 1)
    recipe2.tag_list.add "Hot"
    recipe2.save
    recipe3 = Recipe.create(name: "Pizza3", description: "Very very tasty", directions: "directions",
                          servings: 4, vegan: false, user_id: 1)
    assert_equal [recipe1], recipes.tagged_or_all("Classic")
  end


end