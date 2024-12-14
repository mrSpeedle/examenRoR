# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.create(email: 'operador1@gmail.com', password: '291ABASD932')
User.create(email: 'operador2@gmail.com', password: '931SDABA988')

Material.destroy_all

BaseMaterial.destroy_all

# Agregar algunos materiales predefinidos
BaseMaterial.create(name: 'Plástico', description: 'Material reciclable de plástico')
BaseMaterial.create(name: 'Vidrio', description: 'Material reciclable de vidrio')
BaseMaterial.create(name: 'Papel', description: 'Material reciclable de papel')
BaseMaterial.create(name: 'Metal', description: 'Material reciclable de metal')
BaseMaterial.create(name: 'Cartón', description: 'Material reciclable de cartón')

puts "Materiales base agregados."