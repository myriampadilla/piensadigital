class PlanificadorSerializer < ActiveModel::Serializer
  attributes :id, :estado, :fecha_cambio_estado, :tipo_identificacion, :numero_identificacion, :primer_nombre, :segundo_nombre, :primer_apellido, :segundo_apelldio, :numero_telefonico, :correo_electronico, :direccion
  has_one :usuario
end
