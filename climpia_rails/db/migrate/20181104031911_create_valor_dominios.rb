class CreateValorDominios < ActiveRecord::Migration[5.1]
  def change
    create_table :valor_dominios do |t|
      t.integer :id_valor
      t.string :nombre_valor
      t.references :dominio, foreign_key: true

      t.timestamps
    end
  end
end
