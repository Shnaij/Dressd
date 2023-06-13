# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
puts "Cleaning database.."
OutfitItem.destroy_all
Outfit.destroy_all
ItemStyle.destroy_all
Style.destroy_all
Item.destroy_all
User.destroy_all
puts "Creating items..."
# Create 10 items with a Faker-generated user
elizabeth = User.new(
  email: "elizabeth@gmail.com",
  nickname: "Matita",
  password: "123456"
)
elizabeth.save!
shnai = User.new(
  email: "shnai@gmail.com",
  nickname: "Shnaij",
  password: "123456"
)
file = File.open(Rails.root.join("app/assets/images/profile/shnai.png"))
shnai.avatar.attach(io: file, filename: 'shnai.png', content_type: 'image/png')
shnai.save!
adinda = User.new(
  email: "adinda@gmail.com",
  nickname: "Dindi",
  password: "123456"
)
adinda.save!
bettina = User.new(
  email: "bettina@gmail.com",
  nickname: "Bettina",
  password: "123456"
)
bettina.save!
titles = {
  Dresses: ['Favorite dress', 'Party dress', 'Date night dress', 'Flattering dress', 'Summer dress', 'Casual dress'],
  Tops: ['Best basic top', 'Favorite top', 'Summer top', 'Sexy top', 'I look good top', 'Casual top'],
  Bottoms: ['Favorite pants', 'Comfy pants', 'Summer pants', 'Cool pants', 'My fun pants', 'Casual pants'],
  Shoes: ['Comfy shoes', 'Party shoes', 'Favorite shoes', 'Casual shoes', 'Summer shoes', 'Cool walk shoes']
}
categories = Item::CATEGORIES
brands = ['Zara', 'Mango', 'Gucci', 'H&M', 'American Vintage', '& Other Stories', 'Urban Outfitters', 'TiMo', 'Brandz', 'Sister']
colors = ['bright', 'flowery', 'multicolor']
styles_array = ['sporty', 'casual', 'comfy', 'party', 'evening out']
styles_array.each do |style|
  Style.create(title: style)
end
styles = Style.all
user = [bettina, adinda, shnai, elizabeth]
# for each categories
categories.each do |category|
  puts "Creating #{category}"
  6.times do |num|
    item = Item.new(
      title: titles[category.to_sym][num], # |category|
      category: category, # |category|
      brand: brands.sample,
      color: colors.sample,
      original_price: Faker::Commerce.price(range: 100.0..500.0),
      user: shnai
    )
    # add category folder path /bottoms
    file = File.open(Rails.root.join("app/assets/images/#{category.downcase}/#{category.downcase}#{num + 1}.jpeg"))
    # file = File.open(Rails.root.join("app/assets/images/dresses/hm_dress.jpeg"))
    item.photo.attach(io: file, filename: 'image.jpeg', content_type: 'image/jpeg')
    item.save!
    ItemStyle.create(item: item, style: styles.sample)
  end
end
# ADDING SEEDS
# styles_array = ['sporty', 'casual', 'comfy', 'party', 'evening out']
seeds = {
  Dresses: [
    {
      title: "Crochet lace dress", # the same as the image name (image -> lowercased and underscore)
      color: "cream",
      styles: ["casual", "evening out"]
    },
    {
      title: "Embellished dress",
      color: "purple",
      styles: ["party", "evening out"]
    },
    {
      title: "Floral dress",
      color: "multi",
      styles: ["casual", "comfy"]
    },
    {
      title: "Stripe dress",
      color: "black & white",
      styles: ["casual", "comfy"]
    },
    {
      title: "Tennis dress",
      color: "black",
      styles: ["sporty", "comfy"]
    },
    {
      title: "Tie dye dress",
      color: "blue",
      styles: ["party", "evening out"]
    },
  ],
  Tops: [
     {
      title: "Crop top",
      color: "black",
      styles: ["sporty", "casual"]
    },
    {
      title: "Crochet crop top",
      color: "blue",
      styles: ["casual", "evening out"]
    },
    {
      title: "Twill top",
      color: "green",
      styles: ["evening out", "party"]
    },
    {
      title: "Long sleeve top",
      color: "black",
      styles: ["casual", "sporty"]
    },
    {
      title: "Crochet top",
      color: "black & white",
      styles: ["casual", "evening out"]
    },
    {
      title: "Surfing tshirt",
      color: "white",
      styles: ["casual", "sporty"]
    },
 ],
  Bottoms: [
     {
       title: "Tribal trousers",
       color: "black & white",
       styles: ["comfy", "evening out"]
     },
     {
       title: "Sports leggings",
       color: "camo",
       styles: ["sporty", "comfy"]
     },
     {
      title: "Pleated tennis skirt",
      color: "black",
      styles: ["sporty", "comfy"]
    },
    {
      title: "Linen trousers",
      color: "pink",
      styles: ["comfy", "evening out"]
    },
    {
      title: "Sequin skirt",
      color: "green",
      styles: ["party", "evening out"]
    },
    {
      title: "Denim shorts",
      color: "blue",
      styles: ["comfy", "evening out"]
    },
   ],
   Shoes: [
     {
     title: "Buckle sandals",
     color: "black",
     styles: ["casual", "evening out"]
     },
     {
     title: "Colourblock trainers",
     color: "black & white",
     styles: ["sporty", "casual"]
     },
     {
      title: "Heels",
      color: "black",
      styles: ["evening out", "party"]
      },
      {
        title: "Tribal wedges",
        color: "multi",
        styles: ["evening out", "casual"]
      },
      {
        title: "Heel sandals",
        color: "pink",
        styles: ["evening out", "party"]
      },
      {
        title: "Crochet trainers",
        color: "beige",
        styles: ["casual", "evening out"]
      },
   ],
}
seeds.each do |key, value| # hash of the category and items
  puts "Creating #{key}"
  value.each do |item|
    new_item = Item.new(
      title: item[:title],
      category: key,
      brand: brands.sample,
      color: item[:color],
      original_price: Faker::Commerce.price(range: 100.0..500.0),
      user: shnai
    )
    # add category folder path /bottoms
    file = File.open(Rails.root.join("app/assets/images/#{key.downcase}/#{item[:title]}.png"))
    # file = File.open(Rails.root.join("app/assets/images/dresses/hm_dress.jpeg"))
    new_item.photo.attach(io: file, filename: 'image.jpeg', content_type: 'image/jpeg')
    new_item.save!
    item[:styles].each do |style|
      ItemStyle.create(item: new_item, style: Style.find_by_title(style))
    end
  end
end
