class HospedesController < ApplicationController
  before_action :set_hospede, only: [:show, :edit, :update, :destroy, :confirm_delete]

  def index
    @hospedes = Hospede.all
  end

  def show
  end

  def new
    @hospede = Hospede.new
  end

  def create
    @hospede = Hospede.new(hospede_params)
    if @hospede.save
      redirect_to @hospede, notice: 'Hóspede criado com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @hospede.update(hospede_params)
      redirect_to @hospede, notice: 'Hóspede atualizado com sucesso.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def confirm_delete
    # Este método só renderiza a página de confirmação
  end

  def destroy
    @hospede.destroy
    redirect_to hospedes_url, notice: 'Hóspede removido com sucesso.'
  end

  private

  def set_hospede
    @hospede = Hospede.find(params[:id])
  end

  def hospede_params
    params.require(:hospede).permit(:nome, :documento, :email, :telefone, :endereco)
  end
end