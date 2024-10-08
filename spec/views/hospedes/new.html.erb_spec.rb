require 'rails_helper'

RSpec.describe "hospedes/new", type: :view do
  before(:each) do
    assign(:hospede, Hospede.new(
      nome: "MyString",
      documento: "MyString",
      email: "MyString",
      telefone: "MyString",
      endereco: "MyString"
    ))
  end

  it "renders new hospede form" do
    render

    assert_select "form[action=?][method=?]", hospedes_path, "post" do

      assert_select "input[name=?]", "hospede[nome]"

      assert_select "input[name=?]", "hospede[documento]"

      assert_select "input[name=?]", "hospede[email]"

      assert_select "input[name=?]", "hospede[telefone]"

      assert_select "input[name=?]", "hospede[endereco]"
    end
  end
end
