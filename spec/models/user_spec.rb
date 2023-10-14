require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'John Peter', email: 'a@a.com', password: '123456') }
  before { subject.save! }

  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Email should be present' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'Password must be more than 6 characters' do
    expect(subject.password.length).to be > 5
  end
end
