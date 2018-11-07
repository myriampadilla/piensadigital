class CreatePatrocinadors < ActiveRecord::Migration[5.1]
  def change
    create_table :patrocinadors do |t|
      t.bigint :nit
      t.string :razon_social
      t.string :telefonos
      t.string :nombre_contacto
      t.string :correo_electronico
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
