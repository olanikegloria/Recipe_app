class ShoppingListsController < ApplicationController
  def index
    recipe_id = params[:recipe_id]
    return unless recipe_id.present?

    @recipe = Recipe.includes(:recipe_foods).find(recipe_id)
    @recipe_foods = @recipe.recipe_foods
    @total_amount = 0
    @shopping_list = []
    @foods = current_user.foods
    @foods.each do |food|
      available_quantity = food.quantity
      required_quantity = RecipeFood.where(food_id: food.id).sum(:quantity)
      quantity_needed = available_quantity- required_quantity
      list = {}
      list['name'] = food.name
      list['quantity'] = quantity_needed
      list['price'] = quantity_needed * food.price
      @shopping_list.push(list)

      @total_amount += list['price']
    end
  end

  def generate
    recipe_id = params[:recipe_id]
    redirect_to shopping_lists_path(recipe_id:)
  end
end
