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
       #=========================  
       self.crear_cliente
       self.crear_transportador
       self.crear_patrocinador
       self.crear_centro_acopio
       
       render json: @usuario, status: :created, location: @usuario
       #=========================
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

    def crear_patrocinador
       # 3.Patrocinador
       if (@usuario.id_tipo_usuario == 3)
           @patrocinador  = Patrocinador.find_or_create_by(
            id: @usuario.id, usuario_id: @usuario.id,
            correo_electronico: @usuario.email)
       end
    end

    def crear_transportador
       # 2.Transportador
       # estado transportador
       #    1.por verificar, 2.activo, 3.inactivo, 4.penalizado
       if (@usuario.id_tipo_usuario == 2)

           Rails.logger = Logger.new(STDOUT)
           logger.debug "usuario " + @usuario.inspect

           @transportador  = Transportador.find_or_create_by(
            id: @usuario.id, usuario_id: @usuario.id,
            correo_electronico: @usuario.email,
            estado: '1')

           logger.debug "transportador " + @transportador.inspect
       end   
    end

    def crear_cliente
       # 1.Cliente
       if (@usuario.id_tipo_usuario == 1)
          #@cliente = Cliente.find_or_create_by(usuario_id: @usuario.id)
          @cliente = Cliente.find_or_create_by(
            id: @usuario.id, usuario_id: @usuario.id,
            correo_electronico: @usuario.email)
       end
    end

    def crear_centro_acopio
       # 4.Centro de acopio 
       if (@usuario.id_tipo_usuario == 4)
           @centro_acopio = CentroAcopio.find_or_create_by(
            id: @usuario.id, usuario_id: @usuario.id,
            correo_electronico: @usuario.email)
       end
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
