require 'rails_helper'

RSpec.describe 'recipes/show.html.erb', type: :feature do
  let(:user) { User.create(name: 'Ola', email: 'test@test.com', password: 'password') }
  let(:food) do
    Food.new(user_id: user.id, name: 'Indomine', measurement_unit: '20', price: 10, quantity: 100)
  end
  let(:recipe) do
    Recipe.new(
      name: 'Amala',
      preparation_time: 20,
      cooking_time: 10,
      description: 'this is how',
      public: false,
      user_id: user.id
    )
  end
  let(:recipeFood) do
    RecipeFood.new(recipe_id: recipe.id, quantity: 3, food_id: food.id)
  end

  before { user.save! }
  before { recipe.save! }
  before { food.save! }
  before { recipeFood.save! }

  describe 'Testing integration specs for recipes show page' do
    before :each do
      @quantity = recipeFood.quantity
      login_as(user, scope: :user)
      visit recipe_path(recipe)
    end

    context 'When visiting to recipes show page' do
      it 'can see the preparation_time' do
        expect(page).to have_content("Preparation Time: #{recipe.preparation_time} hour")
      end

      it 'can see the cooking time' do
        expect(page).to have_content("Cooking Time: #{recipe.cooking_time} hour")
      end

      it 'can see the table headers' do
        expect(page).to have_content('Food')
        expect(page).to have_content('Quantity')
        expect(page).to have_content('Value')
        expect(page).to have_content('Actions')
      end

      it 'can see the name of the recipe food' do
        expect(page).to have_content(recipeFood.food.name)
      end

      it 'can see the quantity of the recipe food' do
        expect(page).to have_content(@quantity.to_s)
      end

      it 'can see the total value of the recipe food' do
        expect(page).to have_content(recipeFood.total_price)
      end
    end

    context 'When opening a modal' do
      before :each do
        click_on('Generate shopping List')
      end

      it 'can see the generate button' do
        expect(page).to have_content('Shopping Cart')
      end
    end

    context 'When clicking add ingredient btn' do
      it 'should visit new_recipe_recipes_food_path' do
        click_on 'Add ingredient'
        expect(current_path).to eq new_recipe_recipe_food_path(recipe.id)
      end
    end

    context 'When clicking remove button for ingredient' do
      it 'should remove the ingredient' do
        click_on 'Remove'
        expect(page).not_to have_content(recipeFood.food.name)
      end
    end
  end
end
