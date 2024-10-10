class BaseController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :update, :destroy, :confirm_delete]

  def index
    @resources = resource_class.all
  end

  def show
  end

  def new
    @resource = resource_class.new
  end

  def create
    @resource = resource_class.new(resource_params)
    if @resource.save
      redirect_to @resource, notice: "#{resource_class.name} criado(a) com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @resource.update(resource_params)
      redirect_to @resource, notice: "#{resource_class.name} atualizado(a) com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @resource.destroy
    redirect_to url_for(controller: controller_name), notice: "#{resource_class.name} removido(a) com sucesso."
  end

  def confirm_delete
    # Renderiza uma página de confirmação de exclusão
  end

  private

  def set_resource
    @resource = resource_class.find(params[:id])
  end

  def resource_class
    controller_name.classify.constantize
  end

  def resource_params
    raise NotImplementedError, "Você precisa sobrescrever o método resource_params no controlador #{controller_name}"
  end
end