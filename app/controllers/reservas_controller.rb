class ReservasController < ApplicationController
  before_action :set_reserva, only: [:show, :edit, :update, :destroy, :confirm_delete]

  def index
    @reservas = Reserva.all
  end

  def show
  end

  def new
    @reserva = Reserva.new
  end

  def create
    @reserva = Reserva.new(reserva_params)
    if @reserva.save
      redirect_to @reserva, notice: 'Reserva criada com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @reserva.update(reserva_params)
      redirect_to @reserva, notice: 'Reserva atualizada com sucesso.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def confirm_delete
  end

  def destroy
    @reserva.destroy
    redirect_to reservas_url, notice: 'Reserva removida com sucesso.'
  end

  private

  def set_reserva
    @reserva = Reserva.find(params[:id])
  end

  def reserva_params
    params.require(:reserva).permit(:data_entrada, :data_saida, :hospede_id, :quarto_id)
  end
end