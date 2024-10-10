require 'rails_helper'

RSpec.describe Hospede, type: :model do
  it 'is valid with valid attributes' do
    hospede = Hospede.new(nome: 'Ana', email: 'ana@example.com', documento: '456789123', telefone: '123456789', endereco: 'Rua Exemplo')
    expect(hospede).to be_valid
  end

  it 'is not valid without a name' do
    hospede = Hospede.new(nome: nil)
    expect(hospede).not_to be_valid
  end

  it 'is not valid with an incorrect email format' do
    hospede = Hospede.new(email: 'invalid_email')
    expect(hospede).not_to be_valid
  end

  it 'is not valid without a phone number' do
    hospede = Hospede.new(telefone: nil)
    expect(hospede).not_to be_valid
  end

  it 'is not valid with a duplicate email' do
    Hospede.create(nome: 'Luiz', email: 'luiz@example.com', documento: '321654987', telefone: '987654321', endereco: 'Rua Exemplo 2')
    hospede = Hospede.new(nome: 'Cláudia', email: 'luiz@example.com', documento: '852963741', telefone: '123456789', endereco: 'Rua Exemplo 3')
    expect(hospede).not_to be_valid
  end
end