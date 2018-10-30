class CreateSolicituds < ActiveRecord::Migration[5.1]
  def change
    create_table :solicituds do |t|
      t.integer :numero_solicitud
      t.date :fecha_solicitud
      t.string :estado
      t.date :fecha_cambio_estado
      t.integer :id_tipo_material
      t.integer :id_unidad_medida
      t.decimal :cantidad
      t.string :observaciones
      t.references :cliente, foreign_key: true, null: false
      t.bigint :id_ultimo_servicio

      t.timestamps
    end
  end
end
