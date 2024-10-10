class QuartosController < BaseController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  private

  def resource_params
    params.require(:quarto).permit(:numero, :descricao, :preco_diaria, :capacidade_maxima)
  end
end