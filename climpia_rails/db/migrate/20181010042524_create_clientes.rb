class CreateClientes < ActiveRecord::Migration[5.1]
  def change
    create_table :clientes do |t|
      t.integer :tipo_identificacion
      t.integer :numero_identificacion
      t.string :primer_nombre
      t.string :segundo_nombre
      t.string :primer_apellido
      t.string :segundo_apellido
      t.string :correo_electronico
      t.string :numero_telefonico
      t.string :direccion
      t.integer :puntos_por_redimir
      t.integer :puntos_redimidos
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
