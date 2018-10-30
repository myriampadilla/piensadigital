class SolicitudsController < ApplicationController
  before_action :set_solicitud, only: 
           [:show, :update, :destroy]

  before_action :authenticate_usuario

  # GET /solicituds
  def index
    #Rails.logger = Logger.new(STDOUT)
    #logger.debug "current_usuario " + current_usuario.inspect

    params = ActionController::Parameters.new
    ({cliente_id: 0,
     id_tipo_usuario: 0
     })
    
    params[:cliente_id] = current_usuario.id    
    params[:id_tipo_usuario] = current_usuario.id_tipo_usuario 

    @solicituds = Solicitud.search(params)
    render json: @solicituds    
  end

  # GET /solicituds/1
  def show
      render json: @solicitud
  end

  # POST /solicituds
  def create
    #solcitud.estado 1: Pendiente recoleccion
    @solicitud = Solicitud.new(solicitud_params)
    @solicitud.cliente_id = current_usuario.id
    @solicitud.estado = 1 
    if @solicitud.save
      render json: @solicitud, status: :created, location: @solicitud
    else
      render json: @solicitud.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /solicituds/1
  def update
    if @solicitud.update(solicitud_params)
      render json: @solicitud
    else
      render json: @solicitud.errors, status: :unprocessable_entity
    end
  end

  # DELETE /solicituds/1
  def destroy
    #@solicitud.destroy
    #2-Desistida
    params[:solicitud][:estado] =  2
    if @solicitud.update(solicitud_params)
      render json: @solicitud
    else
      render json: @solicitud.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_solicitud
      @solicitud = Solicitud.find(params[:id])
    end
    
    # Only allow a trusted parameter "white list" through.
    def solicitud_params
      params.require(:solicitud).permit(:numero_solicitud, :fecha_solicitud, :estado, :fecha_cambio_estado, :id_tipo_material, :id_unidad_medida, :cantidad, :observaciones, :cliente_id, :id_ultimo_servicio)
    end

end
