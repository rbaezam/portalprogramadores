class CreateVotosCodigos < ActiveRecord::Migration
  def change
    create_table :votos_codigos do |t|
      t.references :usuario
      t.references :codigo
      t.integer :voto

      t.timestamps
    end
    add_index :votos_codigos, :usuario_id
    add_index :votos_codigos, :codigo_id
  end
end
