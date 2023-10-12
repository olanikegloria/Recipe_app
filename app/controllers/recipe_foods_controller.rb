class RecipeFoodsController < ApplicationController
  before_action :set_recipe, only: %i[show destroy]
  before_action :authenticate_user!

  def index
    @recipe_foods = RecipeFood.all
  end

  def show
    # show
  end

  def new
    @recipe_food = RecipeFood.new
  end

  def create

    @recipeFood = RecipeFood.new(recipe_params)
    @recipe_food.user_id = current_user.id
    if @recipe_food.save
      redirect_to recipe_foods_path
    else
      render :new
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipe_foods_path, notice: 'Recipe was successfully deleted.'
  end
  

  private

  def set_recipe
    @recipe_food = RecipeFood.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:quantity)
  end
end
