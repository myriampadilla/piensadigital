class CreateCompras < ActiveRecord::Migration[5.1]
  def change
    create_table :compras do |t|
      t.references :centro_acopio, foreign_key: true
      t.integer :id_tipo_material
      t.integer :id_unidad_medida
      t.decimal :valor

      t.timestamps
    end
  end
end
