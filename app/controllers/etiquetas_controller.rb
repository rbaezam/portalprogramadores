class EtiquetasController < ApplicationController
  def index
    @etiquetas = Etiqueta.obtener_destacadas
  end

  def show
    @etiqueta = Etiqueta.find(params[:id])
    #@preguntas = []
    @preguntas = Pregunta.joins(:etiquetas).where('etiquetas_preguntas.etiqueta_id' => params[:id])
    @codigos = Codigo.joins(:etiquetas).where('codigos_etiquetas.etiqueta_id' => params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def obtener_por_nombre
    cadena = params[:term]

    tabla = Etiqueta.arel_table
    etiquetas = Etiqueta.where(tabla[:nombre].matches("%#{cadena}%"))

    render :json => etiquetas.to_json
  end
end
