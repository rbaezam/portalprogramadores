class UsuariosController < ApplicationController
  before_filter :authenticate_usuario!

  def index
  end

  def show
    @usuario = current_usuario
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
