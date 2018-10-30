class SolicitudSerializer < ActiveModel::Serializer
  attributes :id, :numero_solicitud, :fecha_solicitud, :estado, :fecha_cambio_estado, :id_tipo_material, :id_unidad_medida, :cantidad, :observaciones, :id_ultimo_servicio
  has_one :cliente
end
