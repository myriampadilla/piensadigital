class Punto < ApplicationRecord
  belongs_to :cliente
  belongs_to :patrocinador
end
