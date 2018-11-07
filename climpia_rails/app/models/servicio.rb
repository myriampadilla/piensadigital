class Servicio < ApplicationRecord
  belongs_to :solicitud
  belongs_to :transportador
end
