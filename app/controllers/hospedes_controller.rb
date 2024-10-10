class HospedesController < BaseController
  def index
    @hospedes = Hospede.all
  end

  def show
    @hospede = Hospede.find(params[:id])
  end

  def new
    @hospede = Hospede.new
  end

  def create
    @hospede = Hospede.new(resource_params)
    if @hospede.save
      redirect_to hospedes_path, notice: 'Hóspede criado com sucesso.'
    else
      render :new
    end
  end

  def edit
    @hospede = Hospede.find(params[:id])
  end

  def update
    @hospede = Hospede.find(params[:id])
    if @hospede.update(resource_params)
      redirect_to hospedes_path, notice: 'Hóspede atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @hospede = Hospede.find(params[:id])
    @hospede.destroy
    redirect_to hospedes_path, notice: 'Hóspede removido com sucesso.'
  end

  private

  def resource_params
    params.require(:hospede).permit(:nome, :documento, :email, :telefone, :endereco)
  end
end