class HomeController < ApplicationController
  def index
    @recipes = Recipe.includes(:recipe_foods).where(public: true).order(created_at: :desc)
  end
end
