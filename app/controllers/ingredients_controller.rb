class IngredientsController < ApplicationController

  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]


  def index
    @ingredient = Ingredient.all
    @tags = ActsAsTaggableOn::Tag.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def edit
  end

  def create
    @ingredient = Ingredient.new(recipe_params)
      if @ingredient.save
        redirect_to @ingredient
      else
        render 'new'
      end
  end

  def update
    if @ingredient.update(recipe_params)
      redirect_to @ingredient
    else
      render 'edit'
    end
  end

  def destroy
    @ingredient.destroy
    redirect_to ingredients_path
  end

  private

    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    def ingredient_params
      params.require(:ingredient).permit(:name)
    end



end
