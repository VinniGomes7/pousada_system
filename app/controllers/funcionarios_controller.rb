class FuncionariosController < BaseController
  private

  def resource_params
    params.require(:funcionario).permit(:nome, :documento, :email, :telefone, :cargo, :salario)
  end
end