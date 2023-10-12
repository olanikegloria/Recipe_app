class FoodsController < ApplicationController
    before_action :set_food, only: %i[show destroy]
    before_action :authenticate_user!
  
    def index
      @foods = Food.all
    end
  
    def show
      # show
    end
  
    def new
      @food = Food.new
    end
  
    def create
      @food = Food.new(food_params)
      @food.user_id = current_user.id
      if @food.save
        redirect_to foods_path
      else
        render :new
      end
    end
  
    def destroy
      @food = Food.find(params[:id])
      @food.destroy
      redirect_to foods_path, notice: 'food was successfully deleted.'
    end
  
    private
  
    def set_food
      @food = Food.find(params[:id])
    end
  
    def food_params
      params.require(:food).permit(:name, :preparation_time, :cooking_time, :description, :public)
    end
end
  