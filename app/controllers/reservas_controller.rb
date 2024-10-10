class ReservasController < BaseController
  private

  def resource_params
    params.require(:reserva).permit(:data_entrada, :data_saida, :hospede_id, :quarto_id)
  end
end