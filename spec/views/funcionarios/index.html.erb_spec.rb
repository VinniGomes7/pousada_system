#require 'rails_helper'

#RSpec.describe "funcionarios/index", type: :view do
#  before(:each) do
#    assign(:funcionarios, [
#      Funcionario.create!(
#        nome: "Nome Teste 1",
#        documento: "123456789",
#        email: "teste1@example.com",
#        cargo: "Cargo Teste 1",
#        telefone: "11999999990",
#        salario: 3000.00
#      ),
#      Funcionario.create!(
#        nome: "Nome Teste 2",
#        documento: "987654321",
#        email: "teste2@example.com",
#        cargo: "Cargo Teste 2",
#        telefone: "11999999991",
#        salario: 4000.00
#      )
#    ])
#  end

#  it "renders a list of funcionarios" do
#    render
#    assert_select "tr>td", text: "Nome Teste 1".to_s, count: 1
#    assert_select "tr>td", text: "Nome Teste 2".to_s, count: 1
#  end
#end
