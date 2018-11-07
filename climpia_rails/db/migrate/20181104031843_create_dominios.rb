class CreateDominios < ActiveRecord::Migration[5.1]
  def change
    create_table :dominios do |t|
      t.integer :id_valor
      t.string :nombre_valor

      t.timestamps
    end
  end
end
