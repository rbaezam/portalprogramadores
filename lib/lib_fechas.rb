module LibFechas

  def obtener_mostrar_fecha(fecha)
    diferencia = Time.now - fecha

    if diferencia > 86400
      cadena = I18n.l fecha.to_date
      return "el #{cadena}"
    else

      horas = 0
      minutos = 0
      texto = ""

      if diferencia > 3600
        horas = (diferencia / 3600).to_i
        diferencia = diferencia - (horas*3600)
        texto << "#{horas}h "
      end
      if diferencia > 60
        minutos = (diferencia / 60).to_i
        texto << "#{minutos}m"
      else
        segundos = diferencia.to_i
        texto << "#{segundos}s"
      end
      return "Hace #{texto}."
    end
  end

end