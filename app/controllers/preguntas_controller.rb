class PreguntasController < ApplicationController
  before_filter :authenticate_usuario!, :except => [:index, :show, :incrementar_vistas]

  def index
    @preguntas = Pregunta.obtener_recientes
  end

  def show
    @pregunta = Pregunta.find(params[:id])
    @relacionadas = @pregunta.obtener_relacionadas
  end

  def new
    @pregunta = Pregunta.new
  end

  def create
    @pregunta = Pregunta.new(params[:pregunta])
    @etiquetas = params[:lista_etiquetas_valor]

    markdown = RDiscount.new(@pregunta.texto)
    @pregunta.texto = markdown.to_html

    @pregunta.usuario = current_usuario
    @pregunta.es_respuesta = false
    #@etiquetas = params[:etiquetas]

    array_etiquetas = @etiquetas.split(/[\s\,]/)
    array_etiquetas.each do |e|
      etiqueta = Etiqueta.where(:nombre => e)
      if etiqueta.empty?
        etiqueta = Etiqueta.new(:nombre => e)
        etiqueta.save
      end
      @pregunta.etiquetas << etiqueta
    end

    if @pregunta.save
      redirect_to root_path
    else
      render :action => :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def guardar_respuesta
    id = params[:idPregunta]
    texto = params[:texto]

    pregunta = Pregunta.find(id)

    @respuesta = Pregunta.new(:texto => texto, :pregunta => pregunta, :es_respuesta => true, :usuario => current_usuario)
    @respuesta.save
    render :json => @respuesta.texto
  end

  def dar_voto
    id = params[:idPregunta]
    valor = params[:valor].to_i

    pregunta = Pregunta.find(id)

    voto = VotoPregunta.where(:usuario_id => current_usuario.id, :pregunta_id => id)
    if voto.blank?
      pregunta.votos = pregunta.votos + valor
      pregunta.save

      VotoPregunta.create(:usuario_id => current_usuario.id, :pregunta_id => id, :voto => valor)

      usuario = pregunta.usuario
      if usuario.reputacion.blank?
        usuario.reputacion = 0
      end
      usuario.reputacion = usuario.reputacion + valor
      usuario.save
    end

    render :json => pregunta.votos
  end

  def mostrar_por_etiqueta
    etiqueta_id = params[:id]
    @preguntas = Pregunta.all(:joins => :etiquetas, :conditions => {"etiquetas.id" => etiqueta_id})
    render 'index'
  end

  def incrementar_vistas
    @pregunta = Pregunta.find(params[:id])
    @pregunta.vistas = @pregunta.vistas + 1
    @pregunta.save
    render :json => @pregunta.vistas
  end
end
