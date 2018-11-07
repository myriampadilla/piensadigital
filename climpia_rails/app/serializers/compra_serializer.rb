class CompraSerializer < ActiveModel::Serializer
  attributes :id, :id_tipo_material, :id_unidad_medida, :valor
  has_one :centro_acopio
end
