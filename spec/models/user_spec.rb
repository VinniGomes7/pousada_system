# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(nome: 'Admin', email: 'admin@example.com', password: 'password')
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user = User.new(nome: nil)
    expect(user).not_to be_valid
  end

  it 'is not valid with an incorrect email format' do
    user = User.new(email: 'invalid_email')
    expect(user).not_to be_valid
  end

  it 'is not valid with a duplicate email' do
    User.create(nome: 'User1', email: 'user@example.com', password: 'password') 
    user = User.new(nome: 'User2', email: 'user@example.com', password: 'password') 
    expect(user).not_to be_valid
  end

  it 'is not valid without a password' do
    user = User.new(password: nil) 
    expect(user).not_to be_valid
  end
end