class DominioSerializer < ActiveModel::Serializer
  attributes :id, :id_valor, :nombre_valor
  has_many :valor_dominio
end
