class QuartosController < BaseController
  def create
    @quarto = Quarto.new(resource_params)
    if @quarto.save
      redirect_to quarto_path(@quarto), notice: 'Quarto criado com sucesso.'
    else
      render :new
    end
  end
  
  def update
    @quarto = Quarto.find(params[:id])
    if @quarto.update(resource_params)
      redirect_to quarto_path(@quarto), notice: 'Quarto atualizado com sucesso.'
    else
      render :edit
    end
  end  

  private

  def resource_params
    params.require(:quarto).permit(:numero, :descricao, :preco_diaria, :capacidade_maxima)
  end
end