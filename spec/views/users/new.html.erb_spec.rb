#require 'rails_helper'

#RSpec.describe "users/new", type: :view do
#  before(:each) do
#    assign(:user, User.new(
#      nome: "MyString",
#      email: "test@example.com",  # Use um email válido
#      password: "password",        # Use uma senha válida
#      role: "MyString"
#    ))
#  end

#  it "renders new user form" do
#    render

#    assert_select "form[action=?][method=?]", users_path, "post" do
#      assert_select "input[name=?]", "user[nome]"
#      assert_select "input[name=?]", "user[email]"
#      assert_select "input[name=?]", "user[password]"  # Corrigido aqui
#      assert_select "input[name=?]", "user[role]"
#    end
#  end
#end