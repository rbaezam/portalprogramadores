# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format
# (all these examples are active by default):
# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end

ActiveSupport::Inflector.inflections do |inflect|
	inflect.irregular 'codigo', 'codigos'
	inflect.irregular 'etiqueta', 'etiquetas'
	inflect.irregular 'pregunta', 'preguntas'
	inflect.irregular 'voto_codigo', 'votos_codigos'
	inflect.irregular 'voto_pregunta', 'votos_preguntas'
end
#
# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.acronym 'RESTful'
# end
