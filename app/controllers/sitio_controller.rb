class SitioController < ApplicationController
  def index
    @preguntas = Pregunta.obtener_recientes
    @codigos = Codigo.obtener_recientes
    @etiquetas_destacadas = Etiqueta.obtener_destacadas
  end

  def acerca_de
  end

  def terminos_servicio
  end
end
