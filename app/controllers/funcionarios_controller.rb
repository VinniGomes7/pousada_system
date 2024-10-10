class FuncionariosController < ApplicationController
  before_action :set_funcionario, only: [:show, :edit, :update, :destroy, :confirm_delete]

  def index
    @funcionarios = Funcionario.all
  end

  def show
  end

  def new
    @funcionario = Funcionario.new
  end

  def create
    @funcionario = Funcionario.new(funcionario_params)
    if @funcionario.save
      redirect_to @funcionario, notice: 'Funcionário criado com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @funcionario.update(funcionario_params)
      redirect_to @funcionario, notice: 'Funcionário atualizado com sucesso.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def confirm_delete
    # Renderiza a página de confirmação de exclusão
  end

  def destroy
    @funcionario.destroy
    redirect_to funcionarios_url, notice: 'Funcionário removido com sucesso.'
  end

  private

  def set_funcionario
    @funcionario = Funcionario.find(params[:id])
  end

  def funcionario_params
    params.require(:funcionario).permit(:nome, :documento, :email, :telefone, :cargo, :salario)
  end
end