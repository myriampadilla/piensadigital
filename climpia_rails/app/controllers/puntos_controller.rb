class PuntosController < ApplicationController
  before_action :set_punto, only: [:show, :update, :destroy]
  before_action :authenticate_usuario

  # GET /puntos
  def index
    @puntos = Punto.all

    render json: @puntos
  end

  # GET /puntos/1
  def show
    render json: @punto
  end

  # POST /puntos
  def create
    @punto = Punto.new(punto_params)

    if @punto.save
      render json: @punto, status: :created, location: @punto
    else
      render json: @punto.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /puntos/1
  def update
    if @punto.update(punto_params)
      render json: @punto
    else
      render json: @punto.errors, status: :unprocessable_entity
    end
  end

  # DELETE /puntos/1
  def destroy
    @punto.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_punto
      @punto = Punto.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def punto_params
      params.require(:punto).permit(:cliente_id, :fecha_redencion, :puntos_redimidos, :almacen, :patrocinador_id)
    end
end
