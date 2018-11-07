class PlanificadorsController < ApplicationController
  before_action :set_planificador, only: [:show, :update, :destroy]

  # GET /planificadors
  def index
    @planificadors = Planificador.all

    render json: @planificadors
  end

  # GET /planificadors/1
  def show
    render json: @planificador
  end

  # POST /planificadors
  def create
    @planificador = Planificador.new(planificador_params)

    if @planificador.save
      render json: @planificador, status: :created, location: @planificador
    else
      render json: @planificador.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /planificadors/1
  def update
    if @planificador.update(planificador_params)
      render json: @planificador
    else
      render json: @planificador.errors, status: :unprocessable_entity
    end
  end

  # DELETE /planificadors/1
  def destroy
    @planificador.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_planificador
      @planificador = Planificador.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def planificador_params
      params.require(:planificador).permit(:estado, :fecha_cambio_estado, :tipo_identificacion, :numero_identificacion, :primer_nombre, :segundo_nombre, :primer_apellido, :segundo_apelldio, :numero_telefonico, :correo_electronico, :direccion, :usuario_id)
    end
end
