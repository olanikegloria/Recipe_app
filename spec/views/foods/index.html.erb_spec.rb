require 'rails_helper'

RSpec.describe 'foods/index.html.erb', type: :feature do
  let(:user) { User.create(name: 'Ola', email: 'test@test.com', password: 'password') }

  describe 'Testing integration specs for foods index page' do
    before :each do
      Food.new(user_id: user.id, name: 'Indomine', measurement_unit: '20', price: 10, quantity: 100)
      login_as(user, scope: :user)
      visit foods_path
    end

    context 'When visiting to food' do
      it 'can see the name of the food' do
        expect(page).to have_content('Foods')
      end
    end

    context 'When clicking on new food button' do
      it 'can see the name of the food' do
        click_on 'Add New Food'
        expect(current_path).to eq(new_food_path)
      end
    end
  end
end
