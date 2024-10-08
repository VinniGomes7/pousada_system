require 'rails_helper'

RSpec.describe "quartos/new", type: :view do
  before(:each) do
    assign(:quarto, Quarto.new(
      numero: "MyString",
      descricao: "MyText",
      tipo: "MyString",
      preco: "9.99"
    ))
  end

  it "renders new quarto form" do
    render

    assert_select "form[action=?][method=?]", quartos_path, "post" do

      assert_select "input[name=?]", "quarto[numero]"

      assert_select "textarea[name=?]", "quarto[descricao]"

      assert_select "input[name=?]", "quarto[tipo]"

      assert_select "input[name=?]", "quarto[preco]"
    end
  end
end
