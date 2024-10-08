require 'rails_helper'

RSpec.describe "hospedes/edit", type: :view do
  before(:each) do
    @hospede = assign(:hospede, Hospede.create!(
      nome: "MyString",
      documento: "MyString",
      email: "MyString",
      telefone: "MyString",
      endereco: "MyString"
    ))
  end

  it "renders the edit hospede form" do
    render

    assert_select "form[action=?][method=?]", hospede_path(@hospede), "post" do

      assert_select "input[name=?]", "hospede[nome]"

      assert_select "input[name=?]", "hospede[documento]"

      assert_select "input[name=?]", "hospede[email]"

      assert_select "input[name=?]", "hospede[telefone]"

      assert_select "input[name=?]", "hospede[endereco]"
    end
  end
end
