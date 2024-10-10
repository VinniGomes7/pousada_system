require 'rails_helper'

RSpec.describe Reserva, type: :model do
  let(:hospede) { Hospede.create(nome: 'Ana', email: 'ana@example.com', documento: '456789123', telefone: '123456789', endereco: 'Rua Exemplo') }
  let(:quarto) { Quarto.create(numero: 101, descricao: 'Deluxe', preco_diaria: 200, capacidade_maxima: 2) }

  it 'is valid with valid attributes' do
    reserva = Reserva.new(data_entrada: Date.today, data_saida: Date.tomorrow, hospede: hospede, quarto: quarto)
    expect(reserva).to be_valid
  end

  it 'is not valid without a check-in date' do
    reserva = Reserva.new(data_entrada: nil, data_saida: Date.tomorrow, hospede: hospede, quarto: quarto)
    expect(reserva).not_to be_valid
  end

  it 'is not valid without a check-out date' do
    reserva = Reserva.new(data_saida: nil, data_entrada: Date.today, hospede: hospede, quarto: quarto)
    expect(reserva).not_to be_valid
  end

  it 'is not valid if check-out date is before check-in date' do
    reserva = Reserva.new(data_entrada: Date.tomorrow, data_saida: Date.today, hospede: hospede, quarto: quarto)
    expect(reserva).not_to be_valid
  end

  it 'is not valid without a guest' do
    reserva = Reserva.new(data_entrada: Date.today, data_saida: Date.tomorrow, hospede: nil, quarto: quarto)
    expect(reserva).not_to be_valid
  end

  it 'is not valid without a room' do
    reserva = Reserva.new(data_entrada: Date.today, data_saida: Date.tomorrow, hospede: hospede, quarto: nil)
    expect(reserva).not_to be_valid
  end
end