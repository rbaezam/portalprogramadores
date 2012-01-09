class Codigo < ActiveRecord::Base
  include LibFechas

  belongs_to :lenguaje
  belongs_to :usuario
  has_and_belongs_to_many :etiquetas

  before_create do |codigo|
  	codigo.vistas = 0
  	codigo.votos = 0
    codigo.descargas = 0
  	codigo.slug = codigo.titulo.parameterize unless codigo.titulo.nil?
  end

  def mostrar_fecha
    return obtener_mostrar_fecha(created_at)
  end

  def self.ae_some_html(s) 

    # converting newlines 
    s.gsub!(/\r\n?/, "\n") 
 
    # escaping HTML to entities 
    s = s.to_s.gsub('&', '&amp;').gsub('<', '&lt;').gsub('>', '&gt;') 
 
    # blockquote tag support 
    s.gsub!(/\n?&lt;blockquote&gt;\n*(.+?)\n*&lt;\/blockquote&gt;/im, "<blockquote>\\1</blockquote>") 
 
    # other tags: b, i, em, strong, u 
    %w(b i em strong u).each { |x|
         s.gsub!(Regexp.new('&lt;(' + x + ')&gt;(.+?)&lt;/('+x+')&gt;',
                 Regexp::MULTILINE|Regexp::IGNORECASE), 
                 "<\\1>\\2</\\1>") 
        } 
 
    # A tag support 
    # href="" attribute auto-adds http:// 
    s = s.gsub(/&lt;a.+?href\s*=\s*['"](.+?)["'].*?&gt;(.+?)&lt;\/a&gt;/im) { |x|
            '<a href="' + ($1.index('://') ? $1 : 'http://'+$1) + "\">" + $2 + "</a>" 
          } 
 
    # replacing newlines to <br> ans <p> tags 
    # wrapping text into paragraph 
    #s = "<p>" + s.gsub(/\n\n+/, "</p>\n\n<p>").
            #gsub(/([^\n]\n)(?=[^\n])/, '\1<br />') + "</p>" 
    s = s.gsub(/([^\n]\n)(?=[^\n])/, '\1<br />')
 
    s      
  end 

  def self.obtener_recientes(cantidad=10)
  	order("created_at desc").limit(cantidad)
  end
end
