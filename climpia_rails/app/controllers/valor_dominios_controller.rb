class ValorDominiosController < ApplicationController
  before_action :set_valor_dominio, only: [:show, :update, :destroy]

  # GET /valor_dominios
  def index
    @valor_dominios = ValorDominio.all
    render json: @valor_dominios
  end

  # GET /valor_dominios/1
  def show
    render json: @valor_dominio
        
  end

  # POST /valor_dominios
  def create
    @valor_dominio = ValorDominio.new(valor_dominio_params)

    if @valor_dominio.save
      render json: @valor_dominio, status: :created, location: @valor_dominio
    else
      render json: @valor_dominio.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /valor_dominios/1
  def update
    if @valor_dominio.update(valor_dominio_params)
      render json: @valor_dominio
    else
      render json: @valor_dominio.errors, status: :unprocessable_entity
    end
  end

  # DELETE /valor_dominios/1
  def destroy
    @valor_dominio.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_valor_dominio
      @valor_dominio = ValorDominio.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def valor_dominio_params
      params.require(:valor_dominio).permit(:id_valor, :nombre_valor, :dominio_id)
    end
end
