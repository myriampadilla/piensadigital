class Solicitud < ApplicationRecord
 belongs_to :cliente

  def self.search (search)

  	Rails.logger = Logger.new(STDOUT)
  	logger.debug "search "+search.inspect

    if search
       logger.debug "antes de find"
  	   self.where(cliente_id: search[:cliente_id]) 
    else
       #Solicitud.all	
    end
 end

end
