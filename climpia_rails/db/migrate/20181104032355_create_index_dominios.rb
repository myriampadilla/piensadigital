class CreateIndexDominios < ActiveRecord::Migration[5.1]
  def change
    change_table :dominios do |t|
      t.index([:id_valor], 
      	unique: true, name: 'dominios_idx1')
    end
  end
end
