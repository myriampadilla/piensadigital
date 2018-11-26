# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

usuarios = Usuario.create ([{username:'admon', email:'admon@gmail.com', 
	password:'12345678', password_confirmation:'12345678', id_tipo_usuario:'0'}])

dominios1 = Dominio.create ([{id_valor:'1', nombre_valor:'Tipos de usuario'}])

valores_dominio_list1 = [
  [ 1,0,'Planificador'],
  [ 1,1,'Cliente'],
  [ 1,2,'Transportador'],
  [ 1,3,'Patrocinador'],
  [ 1,4,'Centro de acopio']
]

valores_dominio_list1.each do |dominio_id, id_valor, nombre_valor|
  ValorDominio.create( dominio_id: dominio_id,
  	               id_valor: id_valor, 
  	               nombre_valor: nombre_valor)
end
#============================
dominios2 = Dominio.create ([{id_valor:'2', nombre_valor:'Estados Solicitud'}])

valores_dominio_list2 = [
  [ 2,1,'Pendiente recoleccion'],
  [ 2,2,'Asignada'],
  [ 2,3,'Finalizada'],
  [ 2,4,'Desistida']
]

valores_dominio_list2.each do |dominio_id, id_valor, nombre_valor|
  ValorDominio.create( dominio_id: dominio_id,
  	               id_valor: id_valor, 
  	               nombre_valor: nombre_valor)
end

#=============================
dominios3 = Dominio.create ([{id_valor:'3', nombre_valor:'Tipo material'}])

valores_dominio_list3 = [
  [ 3,1,'Papel'],
  [ 3,2,'Plastico'],
  [ 3,3,'Medicamentos'],
  [ 3,4,'Electrodomesticos']
 ]

valores_dominio_list3.each do |dominio_id, id_valor, nombre_valor|
  ValorDominio.create( dominio_id: dominio_id,
  	               id_valor: id_valor, 
  	               nombre_valor: nombre_valor)
end
#=============================
dominios4 = Dominio.create ([{id_valor:'4', nombre_valor:'Unidad medida'}])

valores_dominio_list4 = [
  [ 4,1,'Lona'],
  [ 4,2,'kg'],
  [ 4,3,'Unidad']
 ]

valores_dominio_list4.each do |dominio_id, id_valor, nombre_valor|
  ValorDominio.create( dominio_id: dominio_id,
  	               id_valor: id_valor, 
  	               nombre_valor: nombre_valor)
end
#=============================
dominios5 = Dominio.create ([{id_valor:'5', nombre_valor:'Tipo Vehiculo'}])

valores_dominio_list5 = [
  [ 5,1,'Automovil'],
  [ 5,2,'Camioneta'],
  [ 5,3,'Moto'],
  [ 5,4,'Bicicleta'],
  [ 5,5,'Camion'],
  [ 5,6,'Volqueta']
 ]

valores_dominio_list5.each do |dominio_id, id_valor, nombre_valor|
  ValorDominio.create( dominio_id: dominio_id,
                   id_valor: id_valor, 
                   nombre_valor: nombre_valor)
end
#=============================
dominios6 = Dominio.create ([{id_valor:'6', nombre_valor:'Tipo Identificacion'}])

valores_dominio_list6 = [
  [ 6,1,'Cédula de Ciudadanía'],
  [ 6,2,'Cédula de Extranjería'],
  [ 6,3,'Tarjeta de identidad']
 ]

valores_dominio_list6.each do |dominio_id, id_valor, nombre_valor|
  ValorDominio.create( dominio_id: dominio_id,
                   id_valor: id_valor, 
                   nombre_valor: nombre_valor)
end


#=============================
dominios7 = Dominio.create ([{id_valor:'7', nombre_valor:'Estado Trasportador'}])

valores_dominio_list7 = [
  [ 7,1,'Por verificar'],
  [ 7,2,'Activo'],
  [ 7,3,'Inactivo'],
  [ 7,4,'Penalizado']
 ]

valores_dominio_list7.each do |dominio_id, id_valor, nombre_valor|
  ValorDominio.create( dominio_id: dominio_id,
                   id_valor: id_valor, 
                   nombre_valor: nombre_valor)
end
