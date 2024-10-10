require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      nome: "Nome",
      email: "test@example.com",  # Use um email válido
      password: "password",        # Use uma senha válida
      role: "Role"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/test@example.com/)  # Use um email válido
    expect(rendered).to match(/Role/)
  end
end