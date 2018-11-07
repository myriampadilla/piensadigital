class ValorDominioSerializer < ActiveModel::Serializer
  attributes :id, :id_valor, :nombre_valor
  has_one :dominio
end
