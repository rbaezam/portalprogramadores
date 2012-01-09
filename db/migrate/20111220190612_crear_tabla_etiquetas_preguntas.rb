class CrearTablaEtiquetasPreguntas < ActiveRecord::Migration
  def up
  	create_table :etiquetas_preguntas, :id => false do |t|
  		t.integer :pregunta_id
  		t.integer :etiqueta_id
  	end
  end

  def down
  	drop_table :etiquetas_preguntas
  end
end
