#require 'rails_helper'

#RSpec.describe "users/index", type: :view do
#  before(:each) do
#    assign(:users, [
#      User.create!(
#        nome: "Nome",
#        email: "test1@example.com",  # Use um email válido
#        password: "password",         # Use uma senha válida
#        role: "Role"
#      ),
#      User.create!(
#        nome: "Nome",
#        email: "test2@example.com",  # Use um email válido
#        password: "password",         # Use uma senha válida
#        role: "Role"
#      )
#    ])
#  end

#  it "renders a list of users" do
#    render
#    assert_select "tr>td", text: "Nome".to_s, count: 2
#    assert_select "tr>td", text: "test1@example.com".to_s, count: 1
#    assert_select "tr>td", text: "test2@example.com".to_s, count: 1
#    assert_select "tr>td", text: "Role".to_s, count: 2
#  end
#end