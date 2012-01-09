class CodigosController < ApplicationController
  before_filter :llenar_catalogos, :only => [:new, :create, :edit, :update]

  def index
    @codigos = Codigo.obtener_recientes
  end

  def show
    @codigo = Codigo.find(params[:id])

    @codigo.vistas = @codigo.vistas + 1
    @codigo.save
  end

  def new
    @codigo = Codigo.new
  end

  def create
    @codigo = Codigo.new(params[:codigo])
    @codigo.usuario = current_usuario
    @etiquetas = params[:lista_etiquetas_valor]

    #@codigo.texto = @codigo.texto.gsub(/\n/, '<br/>')
    #@codigo.texto = @codigo.texto.gsub(/\ /, '&nbsp;')
    #@codigo.texto = Codigo.ae_some_html(@codigo.texto)
    @codigo.texto.gsub!('<', '&lt;')

    @etiquetas = params[:etiquetas]

    array_etiquetas = @etiquetas.split(/[\s\,]/)
    array_etiquetas.each do |e|
      etiqueta = Etiqueta.where(:nombre => e)
      if etiqueta.empty?
        etiqueta = Etiqueta.new(:nombre => e)
        etiqueta.save
      end

      @codigo.etiquetas << etiqueta
    end

    if @codigo.save
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

  private
  def llenar_catalogos
    @lenguajes = Lenguaje.all
  end
end
