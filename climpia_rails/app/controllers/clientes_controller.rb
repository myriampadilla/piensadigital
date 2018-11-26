class ClientesController < ApplicationController
  before_action :set_cliente, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario
 
  # GET /clientes
  def index
    @clientes = Cliente.all
    render json: @clientes
  end

  # GET /clientes/1
  def show
    render json: @cliente
  end

  # POST /clientes
  def create
    #@cliente = Cliente.new(cliente_params)
    #@cliente.usuario_id = current_usuario.id
    #@cliente.correo_electronico = current_usuario.email

    #if @cliente.save
       #render json: @cliente, status: :created, location: @cliente
    #else
       #render json: @cliente.errors, status: :unprocessable_entity
    #end
  end

  # PATCH/PUT /clientes/1
  def update
    Rails.logger = Logger.new(STDOUT)
    #logger.debug "current_usuario " + current_usuario.inspect

    if (@cliente != nil)
        if (@cliente.usuario_id == current_usuario.id or
           current_usuario.id_tipo_usuario == 0)
        else  
           @cliente = nil
        end
    end

    if @cliente.update(cliente_params)
      render json: @cliente
    else
      render json: @cliente.errors, status: :unprocessable_entity
    end

  end

  # DELETE /clientes/1
  def destroy
    #@cliente.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_cliente
      @cliente = Cliente.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cliente_params
      params.require(:cliente).permit(:tipo_identificacion, :numero_identificacion, 
        :primer_nombre, :segundo_nombre, :primer_apellido, :segundo_apellido, 
        :correo_electronico, :numero_telefonico, :direccion, :puntos_por_redimir, 
        :puntos_redimidos, :usuario_id)
    end
end
