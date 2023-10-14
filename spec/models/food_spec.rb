require 'rails_helper'

RSpec.describe Food, type: :model do
  subject(:user) { User.new(name: 'John Peter', email: 'a@a.com', password: '123456') }
  let(:food) do
    Food.new(user_id: user.id, name: 'Indomine', measurement_unit: '20', price: 10, quantity: 100)
  end

  before { user.save! }
  before { food.save! }

  it 'Name should be present' do
    food.name = nil
    expect(food).to_not be_valid
  end

  it 'Mesurement unit should be present' do
    food.measurement_unit = nil
    expect(food).to_not be_valid
  end

  it 'Price should be present' do
    food.price = nil
    expect(food).to_not be_valid
  end

  it 'Quantity should be present' do
    food.quantity = nil
    expect(food).to_not be_valid
  end
end
