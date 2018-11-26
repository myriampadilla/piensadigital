class ComprasController < ApplicationController
  before_action :set_compra, only: [:show, :update, :destroy]
  before_action :authenticate_usuario

  # GET /compras
  def index
    @compras = Compra.all

    render json: @compras
  end

  # GET /compras/1
  def show
    render json: @compra
  end

  # POST /compras
  def create
    @compra = Compra.new(compra_params)

    if @compra.save
      render json: @compra, status: :created, location: @compra
    else
      render json: @compra.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /compras/1
  def update
    if @compra.update(compra_params)
      render json: @compra
    else
      render json: @compra.errors, status: :unprocessable_entity
    end
  end

  # DELETE /compras/1
  def destroy
    @compra.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_compra
      @compra = Compra.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def compra_params
      params.require(:compra).permit(:centro_acopio_id, :id_tipo_material, :id_unidad_medida, :valor)
    end
end
