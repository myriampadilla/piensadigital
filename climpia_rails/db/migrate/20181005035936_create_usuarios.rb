class CreateUsuarios < ActiveRecord::Migration[5.1]
  def change
    create_table :usuarios do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.integer :id_tipo_usuario

      t.timestamps
    end
  end
end
