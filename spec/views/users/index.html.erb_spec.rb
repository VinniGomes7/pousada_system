require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        nome: "Nome",
        email: "Email",
        password_digest: "Password Digest",
        role: "Role"
      ),
      User.create!(
        nome: "Nome",
        email: "Email",
        password_digest: "Password Digest",
        role: "Role"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", text: "Nome".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
    assert_select "tr>td", text: "Password Digest".to_s, count: 2
    assert_select "tr>td", text: "Role".to_s, count: 2
  end
end
