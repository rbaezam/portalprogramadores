class CrearTablaCodigosEtiquetas < ActiveRecord::Migration
  def up
  	create_table :codigos_etiquetas, :id => false do |t|
  		t.integer :codigo_id
  		t.integer :etiqueta_id
  	end
  end

  def down
  	drop_table :codigos_etiquetas
  end
end
