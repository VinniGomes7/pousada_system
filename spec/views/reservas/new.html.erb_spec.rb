#require 'rails_helper'

#RSpec.describe "reservas/new", type: :view do
#  before(:each) do
#    assign(:reserva, Reserva.new(
#      hospede: nil,
#      quarto: nil
#    ))
#  end

#  it "renders new reserva form" do
#    render

#    assert_select "form[action=?][method=?]", reservas_path, "post" do

#      assert_select "input[name=?]", "reserva[hospede_id]"

#      assert_select "input[name=?]", "reserva[quarto_id]"
#    end
#  end
#end