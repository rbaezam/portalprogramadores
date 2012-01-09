class CreateCodigos < ActiveRecord::Migration
  def change
    create_table :codigos do |t|
      t.string :titulo
      t.string :slug
      t.string :descripcion
      t.text :texto
      t.references :lenguaje
      t.integer :vistas
      t.integer :descargas
      t.integer :votos
      t.references :usuario

      t.timestamps
    end
    add_index :codigos, :lenguaje_id
    add_index :codigos, :usuario_id
  end
end
