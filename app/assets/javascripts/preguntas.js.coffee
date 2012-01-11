# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->

	velocidadMostrarInstrucciones = 'slow'
	efectoMostrarInstrucciones = 'fade'

	$("#pregunta_titulo").focus ->
		$(".seccion-instrucciones").hide()
		$("#instrucciones_titulo").show(efectoMostrarInstrucciones, null, velocidadMostrarInstrucciones)

	$("#pregunta_texto").focus ->
		$(".seccion-instrucciones").hide()
		$("#instrucciones_formato").show(efectoMostrarInstrucciones, null, velocidadMostrarInstrucciones)

	$("#etiquetas").focus ->
		$(".seccion-instrucciones").hide()
		$("#instrucciones_etiquetas").show(efectoMostrarInstrucciones, null, velocidadMostrarInstrucciones)

	$(".markitup").markItUp(mySettings)

	$("#etiquetas").autocomplete
		source: $("#ruta_autocompletar").val(),
		minLength: 2

	$("#etiquetas").keyup ->
		texto = $("#etiquetas").val()
		ultimo = texto.charAt(texto.length-1)
		texto = $.trim(texto.slice(0, -1))
		if((' \t\n\r\v'.indexOf(ultimo) > -1) && (texto.length>1))
			$("#lista_etiquetas").append("<span id='span_" + texto + "'><em>" + texto + " (<a href='#' id='a_" + texto + "' class='quitar_etiqueta'>quitar</a>)</em>&nbsp;&nbsp;</span>")
			lista = $("#lista_etiquetas_valor").val()
			lista = lista + texto + " "
			$("#lista_etiquetas_valor").val(lista)
			$("#etiquetas").val("")

	$(".quitar_etiqueta").live "click", ->
		nombre = $(this).attr("id")
		nombreSpan = "#span" + nombre.substring(1)
		$(nombreSpan).remove()
		return false

	$('#lnkGusta').click ->
		idPregunta = $("#idPregunta").val()
		$.ajax 'dar_voto',
			type: 'post',
			data: {idPregunta:idPregunta, valor:1},
			success: (datos) ->
				$('#votos').html(datos)
		return false

	$('#lnkNoGusta').click ->
		idPregunta = $("#idPregunta").val()
		$.ajax 'dar_voto',
			type: 'post',
			data: {idPregunta:idPregunta, valor:-1},
			success: (datos) ->
				$('#votos').html(datos)
		return false

	$("#submit").click ->
		respuesta = $("#respuesta").val()
		idPregunta = $("#idPregunta").val()
		$.ajax 'guardar_respuesta', 
			type: 'post',
			data: {texto:respuesta, idPregunta:idPregunta},
			success: (datos) ->
				alert('hola')
				return false
				#$("#lista_respuestas").append('<li><p>' + datos + '</p></li>')
		$("#respuesta").val('')
		return false

	$("#btnCancelar").click ->
		$(".dialogoResponder").dialog('close')