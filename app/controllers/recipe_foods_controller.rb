class RecipeFoodsController < ApplicationController
  def new
    puts params[:recipe_id]
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new
  end

  def create
    @recipe = Recipe.find(params[:format])
    @recipe_food = @recipe.recipe_foods.new(recipe_foods_params)

    if @recipe_food.save
      redirect_to recipe_path(@recipe), notice: 'Add new ingredient'
    else
      redirect_to new_recipe_recipe_food_path(@recipe.id)
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy!

    redirect_to recipe_path(@recipe.id), notice: 'Ingredient successfully deleted'
  end

  private

  def recipe_foods_params
    params.require(:recipe_food).permit(:food_id, :quantity)
  end
end
