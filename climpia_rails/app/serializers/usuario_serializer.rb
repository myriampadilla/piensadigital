class UsuarioSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :id_tipo_usuario
end
