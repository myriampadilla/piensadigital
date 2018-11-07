class CreateIndexTransp < ActiveRecord::Migration[5.1]
  def change
      change_table :transportadors do |t|
          t.index :id_servicio_actual
    end
  end
end

