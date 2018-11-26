class PatrocinadorsController < ApplicationController
  before_action :set_patrocinador, only: [:show, :update, :destroy]
  before_action :authenticate_usuario

  # GET /patrocinadors
  def index
    @patrocinadors = Patrocinador.all

    render json: @patrocinadors
  end

  # GET /patrocinadors/1
  def show
    render json: @patrocinador
  end

  # POST /patrocinadors
  def create
    @patrocinador = Patrocinador.new(patrocinador_params)

    if @patrocinador.save
      render json: @patrocinador, status: :created, location: @patrocinador
    else
      render json: @patrocinador.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /patrocinadors/1
  def update
    if @patrocinador.update(patrocinador_params)
      render json: @patrocinador
    else
      render json: @patrocinador.errors, status: :unprocessable_entity
    end
  end

  # DELETE /patrocinadors/1
  def destroy
    @patrocinador.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patrocinador
      @patrocinador = Patrocinador.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def patrocinador_params
      params.require(:patrocinador).permit(:nit, :razon_social, :telefonos, :nombre_contacto, :correo_electronico, :usuario_id)
    end
end
