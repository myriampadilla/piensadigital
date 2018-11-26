class CentroAcopiosController < ApplicationController
  before_action :set_centro_acopio, only: [:show, :update, :destroy]
  before_action :authenticate_usuario
  
  # GET /centro_acopios
  def index
    @centro_acopios = CentroAcopio.all

    render json: @centro_acopios
  end

  # GET /centro_acopios/1
  def show
    render json: @centro_acopio
  end

  # POST /centro_acopios
  def create
    @centro_acopio = CentroAcopio.new(centro_acopio_params)

    if @centro_acopio.save
      render json: @centro_acopio, status: :created, location: @centro_acopio
    else
      render json: @centro_acopio.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /centro_acopios/1
  def update
    if @centro_acopio.update(centro_acopio_params)
      render json: @centro_acopio
    else
      render json: @centro_acopio.errors, status: :unprocessable_entity
    end
  end

  # DELETE /centro_acopios/1
  def destroy
    @centro_acopio.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_centro_acopio
      @centro_acopio = CentroAcopio.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def centro_acopio_params
      params.require(:centro_acopio).permit(:nit, :razon_social, :direccion, :nombre_contacto, :correo_electronico, :usuario_id)
    end
end
