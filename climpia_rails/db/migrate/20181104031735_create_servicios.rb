class CreateServicios < ActiveRecord::Migration[5.1]
  def change
    create_table :servicios do |t|
      t.references :solicitud, foreign_key: true
      t.references :transportador, foreign_key: true
      t.integer :tipo_vehiculo
      t.string :placa_vehiculo
      t.datetime :fecha_creacion_servicio
      t.string :fecha_hora_estimada_recoleccion
      t.string :recoleccion_efectiva_sn
      t.integer :puntos_otorgados_cliente
      t.string :fecha_hora_recoleccion
      t.string :observaciones_calificacion
      t.integer :nota_calificacion
      t.string :observaciones_informe

      t.timestamps
    end
  end
end
