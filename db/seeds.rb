puts "cleaning database..."
User.destroy_all

puts "Seeding database with Plutonians..."
password = "123456"

ken = User.create(email: "ken@gmail.com", password: password, reset_password_token: "ken", username: "Ken")

jessica = User.create(email: "jessica@gmail.com", password: password, reset_password_token: "jessica", username: "Jessica")

tyler = User.create(email: "tyler@gmail.com", password: password, reset_password_token: "tyler", username: "Tyler")

nicole = User.create(email: "nicole@gmail.com", password: password, reset_password_token: "nicole", username: "Nicole")

puts "saving users..."
ken.save
jessica.save
tyler.save
nicole.save

puts "done!"
