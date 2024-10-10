require 'rails_helper'

RSpec.describe "funcionarios/edit", type: :view do
  before(:each) do
    @funcionario = assign(:funcionario, Funcionario.create!(
      nome: "Nome Teste",
      documento: "123456789",
      email: "teste@example.com",
      cargo: "Cargo Teste",
      telefone: "11999999999",
      salario: 3000.00
    ))
  end

  it "renders the edit funcionario form" do
    render

    assert_select "form[action=?][method=?]", funcionario_path(@funcionario), "post" do
      assert_select "input[name=?]", "funcionario[nome]"
      assert_select "input[name=?]", "funcionario[documento]"
      assert_select "input[name=?]", "funcionario[email]"
      assert_select "input[name=?]", "funcionario[cargo]"
      assert_select "input[name=?]", "funcionario[telefone]"
      assert_select "input[name=?]", "funcionario[salario]"
    end
  end
end