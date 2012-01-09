# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111230062056) do

  create_table "codigos", :force => true do |t|
    t.string   "titulo"
    t.string   "slug"
    t.string   "descripcion"
    t.text     "texto"
    t.integer  "lenguaje_id"
    t.integer  "vistas"
    t.integer  "descargas"
    t.integer  "votos"
    t.integer  "usuario_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "codigos", ["lenguaje_id"], :name => "index_codigos_on_lenguaje_id"
  add_index "codigos", ["usuario_id"], :name => "index_codigos_on_usuario_id"

  create_table "codigos_etiquetas", :id => false, :force => true do |t|
    t.integer "codigo_id"
    t.integer "etiqueta_id"
  end

  create_table "etiquetas", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.string   "slug"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "etiquetas_preguntas", :id => false, :force => true do |t|
    t.integer "pregunta_id"
    t.integer "etiqueta_id"
  end

  create_table "lenguajes", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "preguntas", :force => true do |t|
    t.string   "titulo"
    t.text     "texto"
    t.string   "slug"
    t.integer  "usuario_id"
    t.integer  "pregunta_id"
    t.integer  "respuesta_correcta_id"
    t.integer  "votos"
    t.datetime "fecha_publicacion"
    t.integer  "vistas"
    t.boolean  "es_respuesta"
    t.boolean  "completada"
    t.boolean  "activo"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "preguntas", ["pregunta_id"], :name => "index_preguntas_on_pregunta_id"
  add_index "preguntas", ["respuesta_correcta_id"], :name => "index_preguntas_on_respuesta_correcta_id"
  add_index "preguntas", ["usuario_id"], :name => "index_preguntas_on_usuario_id"

  create_table "usuarios", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "login"
    t.string   "nombre"
    t.string   "website"
    t.string   "ubicacion"
    t.date     "fecha_nacimiento"
    t.text     "acerca_de"
    t.integer  "reputacion"
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
  end

  add_index "usuarios", ["email"], :name => "index_usuarios_on_email", :unique => true
  add_index "usuarios", ["reset_password_token"], :name => "index_usuarios_on_reset_password_token", :unique => true

  create_table "votos_codigos", :force => true do |t|
    t.integer  "usuario_id"
    t.integer  "codigo_id"
    t.integer  "voto"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "votos_codigos", ["codigo_id"], :name => "index_votos_codigos_on_codigo_id"
  add_index "votos_codigos", ["usuario_id"], :name => "index_votos_codigos_on_usuario_id"

  create_table "votos_preguntas", :force => true do |t|
    t.integer  "usuario_id"
    t.integer  "pregunta_id"
    t.integer  "voto"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "votos_preguntas", ["pregunta_id"], :name => "index_votos_preguntas_on_pregunta_id"
  add_index "votos_preguntas", ["usuario_id"], :name => "index_votos_preguntas_on_usuario_id"

end
