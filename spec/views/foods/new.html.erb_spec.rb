require 'rails_helper'

RSpec.describe 'foods/new.html.erb', type: :feature do
  let(:user) { User.create(name: 'Yemi', email: 'test@test.com', password: 'password') }
  describe 'Testing createing new food' do
    before :each do
      sign_in user
      visit new_food_path
    end

    context 'When creating a new food' do
      it 'should see the food name' do
        fill_in 'Name', with: 'Semo'
        fill_in 'Measurement unit', with: 32
        fill_in 'Price', with: 20
        fill_in 'Quantity', with: 10
        click_button 'Submit'
        expect(page).to have_text('Semo')
        expect(current_path).to eq(foods_path)
      end
    end
  end
end
