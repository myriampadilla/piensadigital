class ClienteSerializer < ActiveModel::Serializer
  attributes :id, :tipo_identificacion, :numero_identificacion, :primer_nombre, :segundo_nombre, :primer_apellido, :segundo_apellido, :correo_electronico, :numero_telefonico, :direccion, :puntos_por_redimir, :puntos_redimidos
  has_one :usuario
end
