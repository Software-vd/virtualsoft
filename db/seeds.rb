# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

tipodocs = Tipodoc.create([{descripcion: 'Cedula de ciudadania'}, {descripcion: 'Tarjeta de identidad'}])

tamanos = Tamano.create([{descripcion: 'Pie'}, {descripcion: 'Pulgada'}, {descripcion: 'Rastra'}])

tipos = Tipo.create([{Descripcion: 'Tablon'}, {Descripcion: 'Tabla'}, {Descripcion: 'Varilla'}, {Descripcion: 'Cuadro'}, {Descripcion: 'Larguero'}, {Descripcion: 'Can'}])

estadoentregas = Estadoentrega.create([{descripcion: 'Pendiente'}, {descripcion: 'Cancelado'}])
