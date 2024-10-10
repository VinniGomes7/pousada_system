require 'rails_helper'

RSpec.describe Quarto, type: :model do
  let(:valid_attributes) {
    { numero: 101, descricao: 'Deluxe', preco_diaria: 200.0, capacidade_maxima: 2 }
  }

  it 'is valid with valid attributes' do
    quarto = Quarto.new(valid_attributes)
    expect(quarto).to be_valid
  end

  it 'is not valid without a room number' do
    quarto = Quarto.new(valid_attributes.merge(numero: nil))
    expect(quarto).not_to be_valid
  end

  it 'is not valid with a negative price' do
    quarto = Quarto.new(valid_attributes.merge(preco_diaria: -100))
    expect(quarto).not_to be_valid
  end

  it 'is not valid without a maximum capacity' do
    quarto = Quarto.new(valid_attributes.merge(capacidade_maxima: nil))
    expect(quarto).not_to be_valid
  end

  it 'is not valid with a negative maximum capacity' do
    quarto = Quarto.new(valid_attributes.merge(capacidade_maxima: -1))
    expect(quarto).not_to be_valid
  end

  it 'is not valid with a duplicate room number' do
    Quarto.create!(valid_attributes)
    quarto = Quarto.new(valid_attributes.merge(numero: 101))
    expect(quarto).not_to be_valid
  end
end