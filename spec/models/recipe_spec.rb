require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject(:user) { User.new(name: 'John Peter', email: 'a@a.com', password: '123456') }
  let(:recipe) do
    Recipe.new(user_id: user.id, name: 'Indomine', preparation_time: 1.3, cooking_time: 10, description: 'Testing',
               public: true)
  end

  before { user.save! }
  before { recipe.save! }

  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
