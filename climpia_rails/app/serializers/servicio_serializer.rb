class ServicioSerializer < ActiveModel::Serializer
  attributes :id, :tipo_vehiculo, :placa_vehiculo, :fecha_creacion_servicio, :fecha_hora_estimada_recoleccion, :recoleccion_efectiva_sn, :puntos_otorgados_cliente, :fecha_hora_recoleccion, :observaciones_calificacion, :nota_calificacion, :observaciones_informe,
             :solicitud_id, :transportador_id
  has_one :solicitud
  has_one :transportador
end
