class ShoppingListsController < ApplicationController
  def index
    recipe_id = params[:recipe_id]
    return unless recipe_id.present?

    @recipe = Recipe.find(recipe_id)
    @foods = current_user.foods
    @recipe_foods = @recipe.recipe_foods
    @items_to_buy = 0
    @needed_money = 0
    @recipe_foods.each do |recipe_food|
      @food = Food.find(recipe_food.food_id)
      if recipe_food.quantity < @food.quantity
        @items_to_buy += @food.quantity - recipe_food.quantity
        @needed_money += @food.price * (@food.quantity - recipe_food.quantity)
      end
    end
  end

  def generate
    recipe_id = params[:recipe_id]
    redirect_to shopping_lists_path(recipe_id:)
  end
end
