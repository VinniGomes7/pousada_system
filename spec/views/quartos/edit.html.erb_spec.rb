require 'rails_helper'

RSpec.describe "quartos/edit", type: :view do
  before(:each) do
    @quarto = assign(:quarto, Quarto.create!(
      numero: "MyString",
      descricao: "MyText",
      tipo: "MyString",
      preco: "9.99"
    ))
  end

  it "renders the edit quarto form" do
    render

    assert_select "form[action=?][method=?]", quarto_path(@quarto), "post" do

      assert_select "input[name=?]", "quarto[numero]"

      assert_select "textarea[name=?]", "quarto[descricao]"

      assert_select "input[name=?]", "quarto[tipo]"

      assert_select "input[name=?]", "quarto[preco]"
    end
  end
end
