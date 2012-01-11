class Pregunta < ActiveRecord::Base
  include ::LibFechas

  belongs_to :usuario
  belongs_to :pregunta
  has_many :respuestas, :class_name => 'Pregunta'
  has_one :respuesta_correcta, :foreign_key => 'respuesta_correcta_id', :class_name => 'Pregunta'
  has_and_belongs_to_many :etiquetas

  def self.obtener_recientes(cantidad=10)
    where(:es_respuesta => false).order("fecha_publicacion desc").limit(cantidad)
  end

  def self.obtener_preguntas_usuario(usuario, cantidad=10)
    where(:usuario_id => usuario.id).where(:es_respuesta => false).order("fecha_publicacion desc").limit(cantidad)
  end

  def self.obtener_respuestas_usuario(usuario, cantidad=10)
    where(:usuario_id => usuario.id).where(:es_respuesta => true).order("fecha_publicacion desc").limit(cantidad)
  end

  def mostrar_fecha
    return obtener_mostrar_fecha(fecha_publicacion)
  end

  def obtener_relacionadas(cantidad=10)
    Pregunta.where(:es_respuesta => false).order("fecha_publicacion desc").limit(cantidad)
  end

  before_create do |pregunta|
  	pregunta.votos = 0
  	pregunta.fecha_publicacion = Time.now
  	pregunta.vistas = 0
  	pregunta.activo = true
    pregunta.completada = false
  	pregunta.slug = pregunta.titulo.parameterize unless pregunta.titulo.nil?
  end
end
