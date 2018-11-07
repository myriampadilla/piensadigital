# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20181104032355) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "centro_acopios", force: :cascade do |t|
    t.bigint "nit"
    t.string "razon_social"
    t.string "direccion"
    t.string "nombre_contacto"
    t.string "correo_electronico"
    t.bigint "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_centro_acopios_on_usuario_id"
  end

  create_table "clientes", force: :cascade do |t|
    t.integer "tipo_identificacion"
    t.integer "numero_identificacion"
    t.string "primer_nombre"
    t.string "segundo_nombre"
    t.string "primer_apellido"
    t.string "segundo_apellido"
    t.string "correo_electronico"
    t.string "numero_telefonico"
    t.string "direccion"
    t.integer "puntos_por_redimir"
    t.integer "puntos_redimidos"
    t.bigint "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_clientes_on_usuario_id"
  end

  create_table "compras", force: :cascade do |t|
    t.bigint "centro_acopio_id"
    t.integer "id_tipo_material"
    t.integer "id_unidad_medida"
    t.decimal "valor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["centro_acopio_id", "id_tipo_material", "id_unidad_medida"], name: "compras_idx1", unique: true
    t.index ["centro_acopio_id"], name: "index_compras_on_centro_acopio_id"
  end

  create_table "dominios", force: :cascade do |t|
    t.integer "id_valor"
    t.string "nombre_valor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id_valor"], name: "dominios_idx1", unique: true
  end

  create_table "patrocinadors", force: :cascade do |t|
    t.bigint "nit"
    t.string "razon_social"
    t.string "telefonos"
    t.string "nombre_contacto"
    t.string "correo_electronico"
    t.bigint "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_patrocinadors_on_usuario_id"
  end

  create_table "planificadors", force: :cascade do |t|
    t.string "estado"
    t.datetime "fecha_cambio_estado"
    t.integer "tipo_identificacion"
    t.bigint "numero_identificacion"
    t.string "primer_nombre"
    t.string "segundo_nombre"
    t.string "primer_apellido"
    t.string "segundo_apelldio"
    t.string "numero_telefonico"
    t.string "correo_electronico"
    t.string "direccion"
    t.bigint "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_planificadors_on_usuario_id"
  end

  create_table "puntos", force: :cascade do |t|
    t.bigint "cliente_id"
    t.datetime "fecha_redencion"
    t.integer "puntos_redimidos"
    t.string "almacen"
    t.bigint "patrocinador_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_puntos_on_cliente_id"
    t.index ["patrocinador_id"], name: "index_puntos_on_patrocinador_id"
  end

  create_table "servicios", force: :cascade do |t|
    t.bigint "solicitud_id"
    t.bigint "transportador_id"
    t.integer "tipo_vehiculo"
    t.string "placa_vehiculo"
    t.datetime "fecha_creacion_servicio"
    t.string "fecha_hora_estimada_recoleccion"
    t.string "recoleccion_efectiva_sn"
    t.integer "puntos_otorgados_cliente"
    t.string "fecha_hora_recoleccion"
    t.string "observaciones_calificacion"
    t.integer "nota_calificacion"
    t.string "observaciones_informe"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["solicitud_id"], name: "index_servicios_on_solicitud_id"
    t.index ["transportador_id"], name: "index_servicios_on_transportador_id"
  end

  create_table "solicituds", force: :cascade do |t|
    t.integer "numero_solicitud"
    t.date "fecha_solicitud"
    t.string "estado"
    t.date "fecha_cambio_estado"
    t.integer "id_tipo_material"
    t.integer "id_unidad_medida"
    t.decimal "cantidad"
    t.string "observaciones"
    t.bigint "cliente_id", null: false
    t.bigint "id_ultimo_servicio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_solicituds_on_cliente_id"
  end

  create_table "transportadors", force: :cascade do |t|
    t.string "estado"
    t.datetime "fecha_cambio_estado"
    t.bigint "planificador_cambio_estado"
    t.integer "tipo_identificacion"
    t.bigint "numero_identificacion"
    t.string "primer_nombre"
    t.string "segundo_nombre"
    t.string "primer_apellido"
    t.string "segundo_apellido"
    t.string "numero_telefonico"
    t.string "correo_electronico"
    t.string "direccion"
    t.integer "tipo_vehiculo"
    t.string "marca_vehiculo"
    t.string "placa_vehiculo"
    t.bigint "id_servicio_actual"
    t.bigint "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id_servicio_actual"], name: "index_transportadors_on_id_servicio_actual"
    t.index ["usuario_id"], name: "index_transportadors_on_usuario_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.integer "id_tipo_usuario"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "valor_dominios", force: :cascade do |t|
    t.integer "id_valor"
    t.string "nombre_valor"
    t.bigint "dominio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dominio_id", "id_valor"], name: "val_dominios_idx1", unique: true
    t.index ["dominio_id"], name: "index_valor_dominios_on_dominio_id"
  end

  add_foreign_key "centro_acopios", "usuarios"
  add_foreign_key "clientes", "usuarios"
  add_foreign_key "compras", "centro_acopios"
  add_foreign_key "patrocinadors", "usuarios"
  add_foreign_key "planificadors", "usuarios"
  add_foreign_key "puntos", "clientes"
  add_foreign_key "puntos", "patrocinadors"
  add_foreign_key "servicios", "solicituds"
  add_foreign_key "servicios", "transportadors"
  add_foreign_key "solicituds", "clientes"
  add_foreign_key "transportadors", "usuarios"
  add_foreign_key "valor_dominios", "dominios"
end
