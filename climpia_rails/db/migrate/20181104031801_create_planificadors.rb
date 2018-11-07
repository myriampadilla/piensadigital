class CreatePlanificadors < ActiveRecord::Migration[5.1]
  def change
    create_table :planificadors do |t|
      t.string :estado
      t.datetime :fecha_cambio_estado
      t.integer :tipo_identificacion
      t.bigint :numero_identificacion
      t.string :primer_nombre
      t.string :segundo_nombre
      t.string :primer_apellido
      t.string :segundo_apelldio
      t.string :numero_telefonico
      t.string :correo_electronico
      t.string :direccion
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
