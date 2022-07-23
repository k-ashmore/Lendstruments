require 'open-uri'
puts "cleaning database..."
User.destroy_all
Item.destroy_all

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

puts "adding items..."

items = [
  {
    name: "guitar",
    details: "this is a stratocastor that I bought in Ochanomizu, its a little beat up but works great.",
    category: "instrument",
    pickup_location: "Tokyo",
    daily_rate: 2000,
    user: jessica,
    url: "https://res.cloudinary.com/doizo65a2/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1658544832/Lendstruments/photo-1606043357323-69163e39abfc_epkm4g.jpg"
  },

  {
    name: "bass",
    details: "do not drop drop drop the bass",
    category: "instrument",
    pickup_location: "Tokyo",
    daily_rate: 3000,
    user: jessica,
    url: "https://images.unsplash.com/photo-1599010369632-ea06974fd37e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"
  },

  {
    name: "flute",
    details: "this flute has been to bandcamp with me",
    category: "instrument",
    pickup_location: "Tokyo",
    daily_rate: 2000,
    user: tyler,
    url: "https://images.unsplash.com/photo-1530547253710-9bdf4c648014?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1119&q=80"
  },

  {
    name: "turntables",
    details: "I've been spinning these puppies since 1998",
    category: "equipment",
    pickup_location: "Tokyo",
    daily_rate: 6000,
    user: ken,
    url: "https://images.unsplash.com/photo-1461784180009-21121b2f204c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"
  },

  {
    name: "amp",
    details: "this amp goes up to 11",
    category: "equipment",
    pickup_location: "Tokyo",
    daily_rate: 5000,
    user: ken,
    url: "https://images.unsplash.com/photo-1507245921392-e902673ca772?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"
  }
]

i = 1
items.each do |item_info|
  item = Item.new(
    name: item_info[:name],
    details: item_info[:details],
    category: item_info[:category],
    daily_rate: item_info[:daily_rate],
    user: item_info[:user],
    pickup_location: item_info[:pickup_location]
  )

  puts "getting photo for items..."
  downloaded_image = URI.open(item_info[:url])
  item.photo.attach(io: downloaded_image, filename: "item#{i}.jpg")
  i += 1
  if item.save
    puts "#{item.name} was saved!"
  else
    p item.errors.messages
  end
end
