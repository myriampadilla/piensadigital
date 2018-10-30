class UsuariosController < ApplicationController
  #before_action :set_usuario, only: [:show, :update, :destroy]
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario, except: [:create]

  # GET /usuarios
  def index
    @usuarios = Usuario.all
    render json: @usuarios
  end

  # GET /usuarios/1
  def show
    render json: @usuario
  end

  # POST /usuarios
  def create
    @usuario = Usuario.new(usuario_params)
    if @usuario.save
       # Cliente
       if (@usuario.id_tipo_usuario == 1)
          #@cliente = Cliente.find_or_create_by(usuario_id: @usuario.id)
          @cliente = Cliente.find_or_create_by(
            id: @usuario.id, usuario_id: @usuario.id,
            correo_electronico: @usuario.email)
          render json: @usuario, status: :created, location: @usuario
       end
    else
      render json: @usuario.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /usuarios/1
  def update
     params[:usuario][:id_tipo_usuario] =  @usuario.id_tipo_usuario
     if @usuario.update(usuario_params) 
          render json: @usuario
     else
        render json: @usuario.errors, status: :unprocessable_entity
     end
  end

  # DELETE /usuarios/1
  def destroy
      #@usuario.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    
    def set_usuario
      #Rails.logger = Logger.new(STDOUT)
      #logger.debug "current_usuario " + current_usuario.inspect
      #logger.debug "params " + params.inspect
      
      if (params[:id] == '0')
          params[:id] = current_usuario.id
      end

      @usuario = Usuario.find(params[:id])  
      if (@usuario != nil)
         if (current_usuario.id_tipo_usuario == 0 or
             @usuario.id == current_usuario.id)
         else
             @usuario = nil
         end
      end
    end
    
    # Only allow a trusted parameter "white list" through.
    def usuario_params
      #params.require(:usuario).permit(:username, :email, :password_digest, :id_tipo_usuario)
      params.require(:usuario).permit(:username, :email, :password, 
        :password_confirmation, :id_tipo_usuario)
    end

end
