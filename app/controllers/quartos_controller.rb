class QuartosController < ApplicationController
  before_action :set_quarto, only: [:show, :edit, :update, :destroy]

  def index
    @quartos = Quarto.all
  end

  def show
  end

  def new
    @quarto = Quarto.new
  end

  def create
    @quarto = Quarto.new(quarto_params)
    if @quarto.save
      redirect_to @quarto, notice: 'Quarto criado com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @quarto.update(quarto_params)
      redirect_to @quarto, notice: 'Quarto atualizado com sucesso.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @quarto.destroy
    redirect_to quartos_url, notice: 'Quarto removido com sucesso.'
  end

  private

  def set_quarto
    @quarto = Quarto.find(params[:id])
  end

  def quarto_params
    params.require(:quarto).permit(:numero, :descricao, :preco_diaria, :capacidade_maxima)
  end
end