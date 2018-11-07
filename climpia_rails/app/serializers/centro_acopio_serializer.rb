class CentroAcopioSerializer < ActiveModel::Serializer
  attributes :id, :nit, :razon_social, :direccion, :nombre_contacto, :correo_electronico
  has_one :usuario
end
