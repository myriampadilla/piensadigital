class DominiosController < ApplicationController
  before_action :set_dominio, only: [:show, :update, :destroy]

  # GET /dominios
  def index
    @dominios = Dominio.all
    render json: @dominios
  end

  # GET /dominios/1
  def show
    Rails.logger = Logger.new(STDOUT)
    logger.debug "dominio " + @dominio.inspect
      
    render json: @dominio
  end

  # POST /dominios
  def create
    @dominio = Dominio.new(dominio_params)

    if @dominio.save
      render json: @dominio, status: :created, location: @dominio
    else
      render json: @dominio.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dominios/1
  def update
    if @dominio.update(dominio_params)
      render json: @dominio
    else
      render json: @dominio.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dominios/1
  def destroy
    @dominio.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dominio
      @dominio = Dominio.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dominio_params
      params.require(:dominio).permit(:id_valor, :nombre_valor)
    end
end
