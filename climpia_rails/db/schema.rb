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

ActiveRecord::Schema.define(version: 20181027125445) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
  #solicitud.estado:
  # 1-Pendiente recoleccion
  # 2-Desistida
  # 3-Finalizada


  create_table "usuarios", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.integer "id_tipo_usuario"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "clientes", "usuarios"
  add_foreign_key "solicituds", "clientes"
end
