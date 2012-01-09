class CreateVotosPreguntas < ActiveRecord::Migration
  def change
    create_table :votos_preguntas do |t|
      t.references :usuario
      t.references :pregunta
      t.integer :voto

      t.timestamps
    end
    add_index :votos_preguntas, :usuario_id
    add_index :votos_preguntas, :pregunta_id
  end
end
