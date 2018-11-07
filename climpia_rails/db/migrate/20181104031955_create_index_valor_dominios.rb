class CreateIndexValorDominios < ActiveRecord::Migration[5.1]
  def change
    change_table :valor_dominios do |t|
      t.index([:dominio_id,:id_valor], 
      	unique: true, name: 'val_dominios_idx1')
    end
  end
end

