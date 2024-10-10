#require 'rails_helper'

#RSpec.describe "reservas/index", type: :view do
#  before(:each) do
#    assign(:reservas, [
#      Reserva.create!(
#        hospede: nil,
#        quarto: nil
#      ),
#      Reserva.create!(
#        hospede: nil,
#        quarto: nil
#      )
#    ])
#  end

#  it "renders a list of reservas" do
#    render
#    assert_select "tr>td", text: nil.to_s, count: 2
#    assert_select "tr>td", text: nil.to_s, count: 2
#  end
#end