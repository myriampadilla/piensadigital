class CreateIndexCompra < ActiveRecord::Migration[5.1]
  def change
    change_table :compras do |t|
      t.index([:centro_acopio_id,:id_tipo_material,:id_unidad_medida], 
      	unique: true, name: 'compras_idx1')
    end
  end
end
