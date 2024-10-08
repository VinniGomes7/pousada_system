require 'rails_helper'

RSpec.describe "funcionarios/edit", type: :view do
  before(:each) do
    @funcionario = assign(:funcionario, Funcionario.create!(
      nome: "MyString",
      documento: "MyString",
      email: "MyString",
      cargo: "MyString",
      telefone: "MyString"
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
    end
  end
end
