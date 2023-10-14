require 'rails_helper'

RSpec.describe 'Ingredient', type: :request do
  let(:user) { User.create(name: 'Ola', email: 'test@test.com', password: 'password') }
  let(:recipe) do
    Recipe.create(
      name: 'Amala',
      preparation_time: 20,
      cooking_time: 10,
      description: 'this is how',
      public: false,
      user_id: user.id
    )
  end

  describe 'GET /recipes/:recipe_id/recipe_foods/new' do
    before :each do
      sign_in user
      get new_recipe_recipe_food_path(recipe.id)
    end

    it 'returns http success' do
      expect(response.status).to be 200
    end

    it 'should render the correct template' do
      expect(response).to render_template(:new)
    end
  end
end
