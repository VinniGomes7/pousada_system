class FuncionariosController < BaseController
  def create
    @funcionario = Funcionario.new(resource_params)
    if @funcionario.save
      redirect_to funcionario_url(@funcionario), notice: 'Funcionário criado com sucesso.'
    else
      render :new
    end
  end

  def update
    @funcionario = Funcionario.find(params[:id])
    if @funcionario.update(resource_params)
      redirect_to funcionarios_path, notice: 'Funcionário atualizado com sucesso.'
    else
      render :edit
    end
  end

  private

  def resource_params
    params.require(:funcionario).permit(:nome, :documento, :email, :telefone, :cargo, :salario)
  end
end