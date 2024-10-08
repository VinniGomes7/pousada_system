require 'rails_helper'

RSpec.describe "funcionarios/index", type: :view do
  before(:each) do
    assign(:funcionarios, [
      Funcionario.create!(
        nome: "Nome",
        documento: "Documento",
        email: "Email",
        cargo: "Cargo",
        telefone: "Telefone"
      ),
      Funcionario.create!(
        nome: "Nome",
        documento: "Documento",
        email: "Email",
        cargo: "Cargo",
        telefone: "Telefone"
      )
    ])
  end

  it "renders a list of funcionarios" do
    render
    assert_select "tr>td", text: "Nome".to_s, count: 2
    assert_select "tr>td", text: "Documento".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
    assert_select "tr>td", text: "Cargo".to_s, count: 2
    assert_select "tr>td", text: "Telefone".to_s, count: 2
  end
end
