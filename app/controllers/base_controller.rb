class BaseController < ApplicationController
    before_action :set_resource, only: [:show, :edit, :update, :destroy]
  
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
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @resource.update(resource_params)
        redirect_to @resource, notice: "#{resource_class.name} atualizado(a) com sucesso."
      else
        render :edit
      end
    end
  
    def destroy
      @resource.destroy
      redirect_to url_for(controller: controller_name), notice: "#{resource_class.name} removido(a) com sucesso."
    end
  
    private
  
    def set_resource
      @resource = resource_class.find(params[:id])
    end
  
    def resource_class
      controller_name.classify.constantize
    end
  
    def resource_params
      params.require(controller_name.singularize.to_sym).permit(*resource_class.column_names.map(&:to_sym))
    end
  end  