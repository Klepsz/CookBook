class RecipesController < ApplicationController

  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :set_tags_for_select, only: [:new, :create]

  def index
    if params[:search]
      @recipe = Recipe.where(["name LIKE ? OR description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%"])
    else 
      @recipe = Recipe.tagged_or_all(params[:tag])
      
    end
    @tags = ActsAsTaggableOn::Tag.all
  end

  def search
    render :text => @recipe.map(&:name).join(",")
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def edit
  end

  def create
    @recipe = Recipe.new(recipe_params)
      if @recipe.save
        redirect_to @recipe
      else
        render 'new'
      end
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path
  end

  private

    def set_tags_for_select
      @tags = ActsAsTaggableOn::Tag.all.map(&:name).to_json
    end

    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:name, :description, :directions,
                                     :servings, :user_id, :vegan, :tag_list)
    end

end

