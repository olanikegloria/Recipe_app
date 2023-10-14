require 'rails_helper'

RSpec.describe 'recipes/index.html.erb', type: :feature do
  let(:user) { User.create(name: 'Ola', email: 'test@test.com', password: 'password') }

  describe 'Testing integration specs for recipes index page' do
    before :each do
      login_as(user, scope: :user)
      visit recipes_path
    end

    context 'When visiting to recipes' do
      it 'can see the name of the recipe' do
        expect(page).to have_content('Recipes')
      end
    end

    context 'When clicking on new recipe button' do
      it 'can see the name of the recipe' do
        click_on 'Add New Recipe'
        expect(current_path).to eq(new_recipe_path)
      end
    end
  end
end
