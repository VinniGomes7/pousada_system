require 'rails_helper'

RSpec.describe "reservas/edit", type: :view do
  before(:each) do
    @reserva = assign(:reserva, Reserva.create!(
      hospede: nil,
      quarto: nil
    ))
  end

  it "renders the edit reserva form" do
    render

    assert_select "form[action=?][method=?]", reserva_path(@reserva), "post" do

      assert_select "input[name=?]", "reserva[hospede_id]"

      assert_select "input[name=?]", "reserva[quarto_id]"
    end
  end
end
