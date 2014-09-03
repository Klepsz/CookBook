class IngredientForRecipesController < ApplicationController
  before_action :set_recipe
  before_action :set_ingredient_for_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @ingredient_for_recipe = @recipe.ingredient_for_recipes.all
  end

  def new
    @ingredient_for_recipe = @recipe.ingredient_for_recipes.new
  end

  def edit
  end

  def create
    @ingredient_for_recipe = @recipe.ingredient_for_recipes.new(ingredient_for_recipe_params)
      if @ingredient_for_recipe.save
        redirect_to recipe_ingredient_for_recipes_path(@recipe)
      else
        render 'new'
      end
  end

  def update
    if @ingredient_for_recipe.update(ingredient_for_recipe_params)
      redirect_to @ingredient_for_recipe
    else
      render 'edit'
    end
  end

  def destroy
    @ingredient_for_recipe.destroy
    redirect_to ingredient_for_recipes_path
  end

  private

    def set_recipe
      @recipe = Recipe.find(params[:recipe_id])
    end

    def set_ingredient_for_recipe
      @ingredient_for_recipe = @recipe.ingredient_for_recipes.find(params[:id])
    end

    def ingredient_for_recipe_params
      params.require(:ingredient_for_recipe).permit(:ingredient_id, :recipe_id, :unit_id, :amount)
    end

end

