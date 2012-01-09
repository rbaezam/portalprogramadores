class Usuario < ActiveRecord::Base
	include ::LibFechas
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
  		:login, :nombre, :website, :fecha_nacimiento, :ubicacion, :acerca_de, :reputacion

  def mostrar_fecha
    return obtener_mostrar_fecha(created_at)
  end
end
