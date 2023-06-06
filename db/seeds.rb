# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts "Cleaning database.."
Item.destroy_all
User.destroy_all

puts "Creating items..."
# Create 10 items with a Faker-generated user

elizabeth = User.new(
  email: "elizabeth@gmail.com",
  password: "123456"
)
elizabeth.save!

shnai = User.new(
  email: "shnai@gmail.com",
  password: "123456"
)
shnai.save!

adinda = User.new(
  email: "adinda@gmail.com",
  password: "123456"
)
adinda.save!

bettina = User.new(
  email: "bettina@gmail.com",
  password: "123456"
)
bettina.save!

title = ['Favorite summer dress', 'Best basic top', 'Skinny jeans', 'Comfy sneakers', 'Party dress', 'Party heels', 'Jeans shorts']
type = ['dresses', 'tops', 'bottoms', 'shoes']
brand = ['Zara', 'Mango', 'Gucci', 'H&M', 'Lois', 'Levi Strauss & Co', '& Other Stories', 'Nike']
color = ['white/light', 'black/dark', 'blue', 'pink', 'multicolor', 'green']

style = ['sporty', 'casual', 'comfy', 'party', 'evening out']

user = [bettina, adinda, shnai, elizabeth]

type.each do |type|
  8.times do |num|
    item = Item.new(
      title: title.sample,
      type: type.sample,
      brand: brand.sample,
      color: color.sample,
      original_price: Faker::Commerce.price(range: 100.0..500.0),
      user: bettina
    )

    # file = File.open(Rails.root.join("app/assets/images/#{category}#{num + 1}.png"))
    file = File.open(Rails.root.join("app/assets/images/rainbow_dress.png"))
    item.photos.attach(io: file, filename: 'image.png', content_type: 'image/png')

    # Assign categories manually
    item.category = category
    item.save
  end
end
