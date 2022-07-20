# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "cleaning database..."
User.destroy_all

puts "Seeding database with Plutonians..."
password = "123456"

ken = User.create(email: 'ken@gmail.com', password: password, reset_password_token: "ken", username: 'Ken')

jessica = User.create(email: "jessica@gmail.com", password: password, reset_password_token: "jessica", username: 'Jess')

tyler = User.create(email: 'tyler@gmail.com', password: password, reset_password_token: "tyler", username: 'tyler')

nicole = User.create(email: 'nicole@gmail.com', password: password, reset_password_token: "nicole", username: 'nicole')

puts "saving users..."
ken.save
jessica.save
tyler.save
nicole.save

puts "done!"
