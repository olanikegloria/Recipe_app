class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show destroy]
  before_action :authenticate_user!

  def index
    @recipes = Recipe.all
  end

  def show
    # show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      redirect_to recipes_path, notice: 'Add new recipe'
    else
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path, notice: 'Recipe was successfully deleted.'
  end

  def toggle_public
    @recipe = Recipe.find(params[:id])
    @recipe.update(public: !@recipe.public)
    render json: { public: @recipe.public }
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
