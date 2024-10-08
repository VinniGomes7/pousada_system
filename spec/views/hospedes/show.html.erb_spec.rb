require 'rails_helper'

RSpec.describe "hospedes/show", type: :view do
  before(:each) do
    @hospede = assign(:hospede, Hospede.create!(
      nome: "Nome",
      documento: "Documento",
      email: "Email",
      telefone: "Telefone",
      endereco: "Endereco"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Documento/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Telefone/)
    expect(rendered).to match(/Endereco/)
  end
end
