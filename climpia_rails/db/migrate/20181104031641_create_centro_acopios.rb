class CreateCentroAcopios < ActiveRecord::Migration[5.1]
  def change
    create_table :centro_acopios do |t|
      t.bigint :nit
      t.string :razon_social
      t.string :direccion
      t.string :nombre_contacto
      t.string :correo_electronico
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
