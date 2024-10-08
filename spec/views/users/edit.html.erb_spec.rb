require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      nome: "MyString",
      email: "MyString",
      password_digest: "MyString",
      role: "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input[name=?]", "user[nome]"

      assert_select "input[name=?]", "user[email]"

      assert_select "input[name=?]", "user[password_digest]"

      assert_select "input[name=?]", "user[role]"
    end
  end
end
