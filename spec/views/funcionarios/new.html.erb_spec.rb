#require 'rails_helper'

#RSpec.describe "funcionarios/new", type: :view do
#  before(:each) do
#    assign(:funcionario, Funcionario.new(
#      nome: "MyString",
#      documento: "MyString",
#      email: "MyString",
#      cargo: "MyString",
#      telefone: "MyString",
#      salario: 1000.00 # Certifique-se que isso é necessário
#    ))
#  end

#  it "renders new funcionario form" do
#    render

#    assert_select "form[action=?][method=?]", funcionarios_path, "post" do
#      assert_select "input[name=?]", "funcionario[nome]"
#      assert_select "input[name=?]", "funcionario[documento]"
#      assert_select "input[name=?]", "funcionario[email]"
#      assert_select "input[name=?]", "funcionario[cargo]"
#      assert_select "input[name=?]", "funcionario[telefone]"
#      assert_select "input[name=?]", "funcionario[salario]" # Adicionando o campo salário
#    end
#  end
#end