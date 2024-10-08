require 'rails_helper'

RSpec.describe "funcionarios/show", type: :view do
  before(:each) do
    @funcionario = assign(:funcionario, Funcionario.create!(
      nome: "Nome",
      documento: "Documento",
      email: "Email",
      cargo: "Cargo",
      telefone: "Telefone"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Documento/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Cargo/)
    expect(rendered).to match(/Telefone/)
  end
end
