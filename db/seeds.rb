#encoding:utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Lenguaje.delete_all()
len_java = Lenguaje.create(nombre:'Java', descripcion:'Lenguaje de programación Java')
len_php = Lenguaje.create(nombre:'PHP', descripcion:'PHP Hypertext Processor')
len_python = Lenguaje.create(nombre:'Python', descripcion:'Python')
len_ruby = Lenguaje.create(nombre:'Ruby', descripcion:'Ruby')
len_csharp = Lenguaje.create(nombre:'C#', descripcion:'Microsoft C#')
