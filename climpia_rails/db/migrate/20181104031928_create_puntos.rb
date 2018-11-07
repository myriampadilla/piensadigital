class CreatePuntos < ActiveRecord::Migration[5.1]
  def change
    create_table :puntos do |t|
      t.references :cliente, foreign_key: true
      t.datetime :fecha_redencion
      t.integer :puntos_redimidos
      t.string :almacen
      t.references :patrocinador, foreign_key: true

      t.timestamps
    end
  end
end
