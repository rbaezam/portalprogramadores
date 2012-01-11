class UsuariosController < ApplicationController
  before_filter :authenticate_usuario!

  def index
  end

  def show
    @usuario = Usuario.find(params[:id])
    @puede_editar_usuario = (@usuario.id == current_usuario.id)

    @preguntas = Pregunta.obtener_preguntas_usuario(@usuario)
    @respuestas = Pregunta.obtener_respuestas_usuario(@usuario)
  end

  def new
  end

  def create
  end

  def edit
    @usuario = Usuario.find(params[:id])
  end

  def update
    @usuario = Usuario.find(params[:id])

    if @usuario.update_attributes(params[:usuario])
      redirect_to @usuario
    else
      render :action => :edit
    end
  end

  def destroy
  end
end
