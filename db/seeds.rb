# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Admin::Administrator.create(email: 'brunosdias@outlook.com', nome: 'Bruno', telefone: '179734515434', password: '123456', cpf: '41532145212')
  puts "Administrador default criado com sucesso!"
end