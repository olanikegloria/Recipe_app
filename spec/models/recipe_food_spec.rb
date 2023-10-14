require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  subject(:user) { User.new(name: 'John Peter', email: 'a@a.com', password: '123456') }
  let(:recipe) do
    Recipe.new(user_id: user.id, name: 'Indomine', preparation_time: 1.3, cooking_time: 10, description: 'Testing',
               public: true)
  end
  let(:food) do
    Food.new(user_id: user.id, name: 'Indomine', measurement_unit: '20', price: 10, quantity: 100)
  end
  let(:recipeFood) do
    RecipeFood.new(recipe_id: recipe.id, quantity: 3, food_id: food.id)
  end

  before { user.save! }
  before { recipe.save! }
  before { food.save! }
  before { recipeFood.save! }

  before :each do
    @totalvalue = recipeFood.quantity * food.price
    @quantity_needed = recipeFood.quantity - food.quantity
  end

  it 'Quantity should be present' do
    recipeFood.quantity = nil
    expect(recipeFood).to_not be_valid
  end

  it 'should increment the recipes_food totalvalue' do
    expect(recipeFood.total_price).to be @totalvalue
  end

  it 'should increment the recipes_food quantity_needed' do
    expect(recipeFood.quantity_needed).to be @quantity_needed
  end
end
