require 'rails_helper'

RSpec.describe Funcionario, type: :model do
  subject { Funcionario.new(nome: "João Silva", documento: "123456789", email: "joao@exemplo.com", telefone: "11999999999", cargo: "Recepcionista", salario: 3000) }

  it "é válido com atributos válidos" do
    expect(subject).to be_valid
  end

  it "não é válido sem nome" do
    subject.nome = nil
    expect(subject).to_not be_valid
  end

  it "não é válido sem documento" do
    subject.documento = nil
    expect(subject).to_not be_valid
  end

  it "não é válido sem email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "não é válido com email inválido" do
    subject.email = "invalid_email"
    expect(subject).to_not be_valid
  end

  it "não é válido sem telefone" do
    subject.telefone = nil
    expect(subject).to_not be_valid
  end

  it "não é válido sem cargo" do
    subject.cargo = nil
    expect(subject).to_not be_valid
  end

  it "não é válido sem salário" do
    subject.salario = nil
    expect(subject).to_not be_valid
  end

  it "não é válido com salário negativo" do
    subject.salario = -1
    expect(subject).to_not be_valid
  end
end