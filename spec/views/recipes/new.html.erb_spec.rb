require 'rails_helper'

RSpec.describe 'recipes/new.html.erb', type: :feature do
  let(:user) { User.create(name: 'Yemi', email: 'test@test.com', password: 'password') }
  describe 'Testing createing new recipe' do
    before :each do
      sign_in user
      visit new_recipe_path
    end

    context 'When creating a new recipe' do
      it 'should see the recipe name' do
        fill_in 'Name', with: 'Semo'
        fill_in 'Preparation time', with: 3
        fill_in 'Cooking time', with: 2
        fill_in 'Description', with: 'This is how you make semo.'
        click_button 'Submit'
        expect(page).to have_text('Semo')
        expect(page).to have_text('This is how you make semo.')
        expect(current_path).to eq(recipes_path)
      end
    end
  end
end
