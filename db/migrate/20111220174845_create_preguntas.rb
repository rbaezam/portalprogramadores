class CreatePreguntas < ActiveRecord::Migration
  def change
    create_table :preguntas do |t|
      t.string :titulo
      t.text :texto
      t.string :slug
      t.references :usuario
      t.references :pregunta
      t.integer :respuesta_correcta_id
      t.integer :votos
      t.datetime :fecha_publicacion
      t.integer :vistas
      t.boolean :es_respuesta
      t.boolean :completada
      t.boolean :activo

      t.timestamps
    end
    add_index :preguntas, :usuario_id
    add_index :preguntas, :pregunta_id
    add_index :preguntas, :respuesta_correcta_id
  end
end
