class PatrocinadorSerializer < ActiveModel::Serializer
  attributes :id, :nit, :razon_social, :telefonos, :nombre_contacto, :correo_electronico
  has_one :usuario
end
