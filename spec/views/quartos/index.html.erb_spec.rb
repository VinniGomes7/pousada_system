require 'rails_helper'

RSpec.describe "quartos/index", type: :view do
  before(:each) do
    assign(:quartos, [
      Quarto.create!(
        numero: "Numero",
        descricao: "MyText",
        tipo: "Tipo",
        preco: "9.99"
      ),
      Quarto.create!(
        numero: "Numero",
        descricao: "MyText",
        tipo: "Tipo",
        preco: "9.99"
      )
    ])
  end

  it "renders a list of quartos" do
    render
    assert_select "tr>td", text: "Numero".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "Tipo".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
  end
end
