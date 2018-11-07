class PuntoSerializer < ActiveModel::Serializer
  attributes :id, :fecha_redencion, :puntos_redimidos, :almacen
  has_one :cliente
  has_one :patrocinador
end
