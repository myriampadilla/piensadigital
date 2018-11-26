class Solicitud < ApplicationRecord
 belongs_to :cliente

  def self.search (search)

  	#Rails.logger = Logger.new(STDOUT)
  	#logger.debug "search "+search.inspect

    if search 
       if (search[:id_tipo_usuario] == 2)
          #busque transportador y obtenga id_servicio_actual
          #si id_servicio_actual != 0
          #   busque servicio (id_servicio_actual) y obtenga id_solicitud
          #   busque esa solicitud especifica
          #si id_servicio_actual == 0
          #   busque solicitudes con estado 1 Pendiente recoleccion
           self.where(estado: search[:estado]) 
       else
           if (search[:id_tipo_usuario] == 1)
  	           self.where(cliente_id: search[:cliente_id]) 
           end
  	   end
    else
       #Solicitud.all	
    end
 end

end
