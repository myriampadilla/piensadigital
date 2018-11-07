class CreateTransportadors < ActiveRecord::Migration[5.1]
  def change
    create_table :transportadors do |t|
      t.string :estado
      t.datetime :fecha_cambio_estado
      t.bigint :planificador_cambio_estado
      t.integer :tipo_identificacion
      t.bigint :numero_identificacion
      t.string :primer_nombre
      t.string :segundo_nombre
      t.string :primer_apellido
      t.string :segundo_apellido
      t.string :numero_telefonico
      t.string :correo_electronico
      t.string :direccion
      t.integer :tipo_vehiculo
      t.string :marca_vehiculo
      t.string :placa_vehiculo
      t.bigint :id_servicio_actual
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
