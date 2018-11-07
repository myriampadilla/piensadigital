class TransportadorSerializer < ActiveModel::Serializer
  attributes :id, :estado, :fecha_cambio_estado, :planificador_cambio_estado, :tipo_identificacion, :numero_identificacion, :primer_nombre, :segundo_nombre, :primer_apellido, :segundo_apellido, :numero_telefonico, :correo_electronico, :direccion, :tipo_vehiculo, :marca_vehiculo, :placa_vehiculo, :id_servicio_actual
  has_one :usuario
end
