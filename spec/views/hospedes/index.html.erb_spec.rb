#require 'rails_helper'

#RSpec.describe "hospedes/index", type: :view do
#  before(:each) do
#    assign(:hospedes, [
#      Hospede.create!(
#        nome: "Nome",
#        documento: "Documento",
#        email: "Email",
#        telefone: "Telefone",
#        endereco: "Endereco"
#      ),
#      Hospede.create!(
#        nome: "Nome",
#        documento: "Documento",
#        email: "Email",
#        telefone: "Telefone",
#        endereco: "Endereco"
#      )
#    ])
#  end

#  it "renders a list of hospedes" do
#    render
#    assert_select "tr>td", text: "Nome".to_s, count: 2
#    assert_select "tr>td", text: "Documento".to_s, count: 2
#    assert_select "tr>td", text: "Email".to_s, count: 2
#    assert_select "tr>td", text: "Telefone".to_s, count: 2
#    assert_select "tr>td", text: "Endereco".to_s, count: 2
#  end
#end