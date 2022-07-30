require 'open-uri'
puts "cleaning database..."
Booking.destroy_all
Item.destroy_all
User.destroy_all

puts "Seeding database with Plutonians..."
password = "123456"

ken = User.create(
  email: "ken@gmail.com",
  password: password,
  reset_password_token: "ken",
  username: "Ken"
)
file = URI.open("https://avatars.githubusercontent.com/u/100769790?v=4")
ken.avatar.attach(io: file, filename: 'ken.jpg', content_type: 'image/jpg')

jessica = User.create(
  email: "jessica@gmail.com",
  password: password,
  reset_password_token: "jessica",
  username: "Jessica"
)
file = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1652752226/fu2oo0fckijyi9hkus1u.jpg")
jessica.avatar.attach(io: file, filename: 'jess.jpg', content_type: 'image/jpg')

tyler = User.create(
  email: "tyler@gmail.com",
  password: password,
  reset_password_token: "tyler",
  username: "Tyler"
)
file = URI.open("https://avatars.githubusercontent.com/u/101543224?v=4")
tyler.avatar.attach(io: file, filename: 'tyler.jpg', content_type: 'image/jpg')

nicole = User.create(
  email: "nicole@gmail.com",
  password: password,
  reset_password_token:"nicole",
  username: "Nicole"
)
file = URI.open("https://avatars.githubusercontent.com/u/74501096?v=4")
nicole.avatar.attach(io: file, filename: 'nicole.jpg', content_type: 'image/jpg')

puts "saving users..."
ken.save
jessica.save
tyler.save
nicole.save

puts "adding items..."
items = [
  {
    name: "violin",
    details: "this is a normal violin. I love it",
    category: "Instruments",
    pickup_location: "Shinjuku",
    daily_rate: 30_000,
    user: nicole,
    url: "https://res.cloudinary.com/doizo65a2/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1659161873/Lendstruments/photo-1624367171718-14026220ee35_rmdete.jpg"
  },

  {
    name: "sound board",
    details: "this is a normal sound board. I love it",
    category: "Recording equipment",
    pickup_location: "Okubo",
    daily_rate: 30_000,
    user: nicole,
    url: "https://res.cloudinary.com/doizo65a2/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1659162604/Lendstruments/photo-1520950335585-0f7c2f58d481_bvsboy.jpg"
  },

  {
    name: "mic",
    details: "this is a normal mic. I love it",
    category: "Recording equipment",
    pickup_location: "Harajuku",
    daily_rate: 3000,
    user: nicole,
    url: "https://res.cloudinary.com/doizo65a2/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1659162707/Lendstruments/photo-1521424159246-e4a66f267e4b_mxspdm.jpg"
  },

  {
    name: "guitar",
    details: "this is a stratocastor that I bought in Ochanomizu, its a little beat up but works great.",
    category: "Instruments",
    pickup_location: "Yokohama",
    daily_rate: 2000,
    user: jessica,
    url: "https://res.cloudinary.com/doizo65a2/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1658544832/Lendstruments/photo-1606043357323-69163e39abfc_epkm4g.jpg"
  },

  {
    name: "bass",
    details: "do not drop drop drop the bass",
    category: "Instruments",
    pickup_location: "Shibuya",
    daily_rate: 3000,
    user: jessica,
    url: "https://res.cloudinary.com/doizo65a2/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1658544858/Lendstruments/photo-1599010369632-ea06974fd37e_wezpq1.jpg"
  },

  {
    name: "flute",
    details: "this flute has been to bandcamp with me",
    category: "Instruments",
    pickup_location: "Tokyo",
    daily_rate: 2000,
    user: tyler,
    url: "https://res.cloudinary.com/doizo65a2/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1658547166/Lendstruments/photo-1530547253710-9bdf4c648014_b5i6xz.jpg"
  },

  {
    name: "turntables",
    details: "I've been spinning these puppies since 1998",
    category: "DJ gear",
    pickup_location: "Asakusa",
    daily_rate: 6000,
    user: ken,
    url: "https://res.cloudinary.com/doizo65a2/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1658547214/Lendstruments/photo-1461784180009-21121b2f204c_ii7lpo.jpg"
  },

  {
    name: "amp",
    details: "this amp goes up to 11",
    category: "Amps",
    pickup_location: "Meguro",
    daily_rate: 5000,
    user: ken,
    url: "https://res.cloudinary.com/doizo65a2/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1658547251/Lendstruments/photo-1507245921392-e902673ca772_aosxl8.jpg"
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
  item.photo.attach(io: downloaded_image, filename: "item#{i}.png", content_type: "image/png")
  i += 1
  if item.save
    puts "#{item.name} was saved!"
  else
    p item.errors.messages
  end

  puts "Seeded successfully!"

end
