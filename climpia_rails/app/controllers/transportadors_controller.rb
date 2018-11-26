class TransportadorsController < ApplicationController
  before_action :set_transportador, only: [:show, :update, :destroy]
  before_action :authenticate_usuario

  # GET /transportadors
  def index
    @transportadors = Transportador.all

    render json: @transportadors
  end

  # GET /transportadors/1
  def show
    render json: @transportador
  end

  # POST /transportadors
  def create
    @transportador = Transportador.new(transportador_params)

    if @transportador.save
      render json: @transportador, status: :created, location: @transportador
    else
      render json: @transportador.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /transportadors/1
  def update
    if @transportador.update(transportador_params)
      render json: @transportador
    else
      render json: @transportador.errors, status: :unprocessable_entity
    end
  end

  # DELETE /transportadors/1
  def destroy
    @transportador.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transportador
      @transportador = Transportador.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def transportador_params
      params.require(:transportador).permit(:estado, :fecha_cambio_estado, :planificador_cambio_estado, :tipo_identificacion, :numero_identificacion, :primer_nombre, :segundo_nombre, :primer_apellido, :segundo_apellido, :numero_telefonico, :correo_electronico, :direccion, :tipo_vehiculo, :marca_vehiculo, :placa_vehiculo, :id_servicio_actual, :usuario_id)
    end
end
