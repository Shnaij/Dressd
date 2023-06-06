# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts "Cleaning database.."
ItemStyle.destroy_all
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

dress_titles = ['Favorite dress', 'Party dress', 'Date night dress', 'Flattering dress', 'Summer dress', 'Casual dress']
tops_titles = ['Best basic top', 'Favorite top', 'Summer top', 'Sexy top', 'I look good top', 'Casual top']
bottoms_titles = ['Favorite pants', 'Comfy pants', 'Summer pants', 'Cool pants', 'My sexy pants', 'Casual pants']
shoes_titles = ['Comfy shoes', 'Party shoes', 'Favorite shoes', 'Casual shoes', 'Summer shoes', 'Cool walk shoes']

types = ['dresses', 'tops', 'bottoms', 'shoes']
brands = ['Zara', 'Mango', 'Gucci', 'H&M', 'American Vintage', '& Other Stories', 'Urban Outfitters', 'TiMo', 'Brandz', 'Sister']
colors = ['white/light', 'black/dark', 'blue', 'pink', 'multicolor', 'green']

styles_array = ['sporty', 'casual', 'comfy', 'party', 'evening out']
styles_array.each do |style|
  Style.create(title: style)
end
styles = Style.all

user = [bettina, adinda, shnai, elizabeth]

6.times do
  item = Item.new(
    title: dress_titles.sample,
    category: "dresses",
    brand: brands.sample,
    color: colors.sample,
    original_price: Faker::Commerce.price(range: 100.0..500.0),
    user: bettina
  )

  # file = File.open(Rails.root.join("app/assets/images/#{category}#{num + 1}.jpeg"))
  file = File.open(Rails.root.join("app/assets/images/hm_dress.jpeg"))
  item.photo.attach(io: file, filename: 'image.jpeg', content_type: 'image/jpeg')

  item.save

  ItemStyle.create(item: item, style: styles.sample)
end

6.times do
  item = Item.new(
    title: tops_titles.sample,
    category: "tops",
    brand: brands.sample,
    color: colors.sample,
    original_price: Faker::Commerce.price(range: 100.0..500.0),
    user: bettina
  )

  # file = File.open(Rails.root.join("app/assets/images/#{category}#{num + 1}.jpeg"))
  file = File.open(Rails.root.join("app/assets/images/hm_top.jpeg"))
  item.photo.attach(io: file, filename: 'image.jpeg', content_type: 'image/jpeg')

  item.save

  ItemStyle.create(item: item, style: styles.sample)
end

6.times do
  item = Item.new(
    title: bottoms_titles.sample,
    category: "bottoms",
    brand: brands.sample,
    color: colors.sample,
    original_price: Faker::Commerce.price(range: 100.0..500.0),
    user: bettina
  )

  # file = File.open(Rails.root.join("app/assets/images/#{category}#{num + 1}.jpeg"))
  file = File.open(Rails.root.join("app/assets/images/hm_pants.jpeg"))
  item.photo.attach(io: file, filename: 'image.jpeg', content_type: 'image/jpeg')

  item.save

  ItemStyle.create(item: item, style: styles.sample)
end

6.times do
  item = Item.new(
    title: shoes_titles.sample,
    category: "shoes",
    brand: brands.sample,
    color: colors.sample,
    original_price: Faker::Commerce.price(range: 100.0..500.0),
    user: bettina
  )

  # file = File.open(Rails.root.join("app/assets/images/#{category}#{num + 1}.jpeg"))
  file = File.open(Rails.root.join("app/assets/images/hm_shoes.jpeg"))
  item.photo.attach(io: file, filename: 'image.jpeg', content_type: 'image/jpeg')

  item.save

  ItemStyle.create(item: item, style: styles.sample)
end
