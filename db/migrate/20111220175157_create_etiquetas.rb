class CreateEtiquetas < ActiveRecord::Migration
  def change
    create_table :etiquetas do |t|
      t.string :nombre
      t.string :descripcion
      t.string :slug

      t.timestamps
    end
  end
end
