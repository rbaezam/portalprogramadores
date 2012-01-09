class Etiqueta < ActiveRecord::Base
	has_and_belongs_to_many :preguntas
	has_and_belongs_to_many :codigos

	before_create do |etiqueta|
  	etiqueta.slug = etiqueta.nombre.parameterize unless etiqueta.nombre.nil?
	end

	def self.obtener_destacadas(cantidad=10)
		limit(cantidad)
	end

	def as_json(options = {})
		json = {:id => id, :value => nombre}
		json
	end
end
