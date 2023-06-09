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

# titles = {
#   Dresses: ['Favorite dress', 'Party dress', 'Date night dress', 'Flattering dress', 'Summer dress', 'Casual dress'],
#   Tops: ['Best basic top', 'Favorite top', 'Summer top', 'Sexy top', 'I look good top', 'Casual top'],
#   Bottoms: ['Favorite pants', 'Comfy pants', 'Summer pants', 'Cool pants', 'My fun pants', 'Casual pants'],
#   Shoes: ['Comfy shoes', 'Party shoes', 'Favorite shoes', 'Casual shoes', 'Summer shoes', 'Cool walk shoes']
# }

# categories = Item::CATEGORIES
brands = ['Zara', 'Mango', 'Gucci', 'H&M', 'American Vintage', '& Other Stories', 'Urban Outfitters', 'TiMo', 'Brandz', 'Sister']
# # colors = ['bright', 'flowery', 'multicolor']

styles_array = ['sporty', 'casual', 'comfy', 'party', 'evening out']
styles_array.each do |style|
  Style.create(title: style)
end

# styles = Style.all

users = [bettina, adinda, shnai, elizabeth]

# # for each categories
# categories.each do |category|
#   puts "Creating #{category}"
#   3.times do |num|
#     item = Item.new(
#       title: titles[category.to_sym][num], # |category|
#       category: category, # |category|
#       brand: brands.sample,
#       color: colors.sample,
#       original_price: Faker::Commerce.price(range: 100.0..500.0),
#       user: shnai
#     )

#     # add category folder path /bottoms
#     file = File.open(Rails.root.join("app/assets/images/#{category.downcase}/#{category.downcase}#{num + 1}.png"))
#     # file = File.open(Rails.root.join("app/assets/images/dresses/hm_dress.png"))
#     item.photo.attach(io: file, filename: 'image.png', content_type: 'image/png')

#     item.save!

#     ItemStyle.create(item: item, style: styles.sample)
#   end
# end


# ADDING SEEDS
# styles_array = ['sporty', 'casual', 'comfy', 'party', 'evening out']
# NAMES = ["dry and hot", "dry and medium warm", "dry and cold", "rainy and hot", "rainy and medium warm", "rainy and cold"]
seeds = {
  Dresses: [
    {
      title: "Crochet lace dress", # the same as the image name (image -> lowercased and underscore)
      color: "cream",
      styles: ["casual", "evening out"],
      weather: ["dry and hot", "dry and medium warm", "rainy and hot"]
    },
    {
      title: "Embellished dress",
      color: "purple",
      styles: ["party", "evening out"],
      weather: ["dry and hot", "dry and medium warm", "rainy and medium warm"]
    },
    {
      title: "Floral dress",
      color: "multi",
      styles: ["casual", "comfy"],
      weather: ["dry and hot", "dry and medium warm", "rainy and hot"]
    },
    {
      title: "Stripe dress",
      color: "black & white",
      styles: ["casual", "comfy"],
      weather: ["dry and hot", "dry and medium warm", "rainy and hot"]
    },
    {
      title: "Tennis dress",
      color: "black",
      styles: ["sporty", "comfy"],
      weather: ["dry and hot", "dry and medium warm", "rainy and hot", "rainy and medium warm"]
    },
    {
      title: "Tie dye dress",
      color: "blue",
      styles: ["party", "evening out"],
      weather: ["dry and hot", "dry and medium warm", "rainy and hot",]
    },
    {
      title: "Floral ruffle dress",
      color: "multi",
      styles: ["casual", "evening out"],
      weather: ["dry and hot", "dry and medium warm", "rainy and hot", "rainy and medium warm"]
    },
    {
      title: "Tropical maxi dress",
      color: "multi",
      styles: ["casual", "comfy"],
      weather: ["dry and hot", "dry and medium warm", "rainy and hot", "rainy and medium warm"]
    },
    {
      title: "Tie dye maxi dress",
      color: "multi",
      styles: ["evening out", "party"],
      weather: ["dry and hot", "dry and medium warm", "rainy and hot", "rainy and medium warm"]
    },
    {
      title: "Floral halter dress",
      color: "multi",
      styles: ["casual", "comfy"],
      weather: ["dry and hot", "dry and medium warm", "rainy and hot"]
    },
  ],
  Tops: [
     {
      title: "Crop top",
      color: "black",
      styles: ["sporty", "casual"],
      weather: ["dry and hot", "dry and medium warm", "rainy and hot", "rainy and medium warm"]
    },
    {
      title: "Crochet crop top",
      color: "blue",
      styles: ["casual", "evening out"],
      weather: ["dry and hot", "dry and medium warm", "rainy and medium warm", "dry and cold", "rainy and cold"]
    },
    {
      title: "Twill top",
      color: "green",
      styles: ["evening out", "party"],
      weather: ["dry and hot", "dry and medium warm", "rainy and hot", "rainy and medium warm"]
    },
    {
      title: "Long sleeve top",
      color: "black",
      styles: ["casual", "sporty"],
      weather: ["dry and medium warm", "rainy and medium warm", "dry and cold", "rainy and cold"]
    },
    {
      title: "Crochet top",
      color: "black & white",
      styles: ["casual", "evening out"],
      weather: ["dry and hot", "dry and medium warm", "rainy and hot", "rainy and medium warm"]
    },
    {
      title: "Surfing tshirt",
      color: "white",
      styles: ["casual", "sporty"],
      weather: ["dry and hot", "dry and medium warm", "rainy and hot", "rainy and medium warm"]
    },
    {
      title: "Tropical crop top",
      color: "multi",
      styles: ["casual", "evening out"],
      weather: ["dry and hot", "dry and medium warm", "rainy and hot", "rainy and medium warm"]
    },
    {
      title: "Stripe vest top",
      color: "green",
      styles: ["casual", "comfy"],
      weather: ["dry and hot", "dry and medium warm", "rainy and hot", "rainy and medium warm"]
    },
 ],
  Bottoms: [
     {
       title: "Tribal trousers",
       color: "black & white",
       styles: ["comfy", "evening out"],
       weather: ["dry and hot", "dry and medium warm", "rainy and hot", "rainy and medium warm", "dry and cold", "rainy and cold"]
     },
     {
       title: "Sports leggings",
       color: "camo",
       styles: ["sporty", "comfy"],
       weather: ["dry and medium warm", "rainy and hot", "rainy and medium warm", "dry and cold", "rainy and cold"]
     },
     {
      title: "Pleated tennis skirt",
      color: "black",
      styles: ["sporty", "comfy"],
      weather: ["dry and hot", "dry and medium warm", "rainy and hot", "rainy and medium warm"]
    },
    {
      title: "Linen trousers",
      color: "pink",
      styles: ["comfy", "evening out"],
      weather: ["dry and hot", "dry and medium warm", "rainy and hot", "rainy and medium warm", "dry and cold", "rainy and cold"]
    },
    {
      title: "Sequin skirt",
      color: "green",
      styles: ["party", "evening out"],
      weather: ["dry and hot", "dry and medium warm", "rainy and hot", "rainy and medium warm"]
    },
    {
      title: "Denim shorts",
      color: "blue",
      styles: ["comfy", "evening out"],
      weather: ["dry and hot", "dry and medium warm", "rainy and hot", "rainy and medium warm"]
    },
    {
      title: "Pleated trousers",
      color: "green",
      styles: ["comfy", "casual"],
      weather: ["dry and hot", "dry and medium warm", "rainy and hot", "rainy and medium warm", "dry and cold", "rainy and cold"]
    },
    {
      title: "Linen pleated trousers",
      color: "cream",
      styles: ["comfy", "casual"],
      weather: ["dry and hot", "dry and medium warm", "rainy and hot", "rainy and medium warm", "dry and cold", "rainy and cold"]
    },
    {
      title: "Tropical trousers",
      color: "multi",
      styles: ["comfy", "casual"],
      weather: ["dry and hot", "dry and medium warm", "rainy and hot", "rainy and medium warm"]
    },
    {
      title: "Wide leg trousers",
      color: "pink",
      styles: ["comfy", "casual"],
      weather: ["dry and hot", "dry and medium warm", "rainy and hot", "rainy and medium warm"]
    },
    {
      title: "Leggings",
      color: "pink",
      styles: ["sporty", "comfy"],
      weather: ["dry and hot", "dry and medium warm", "rainy and hot", "rainy and medium warm", "dry and cold", "rainy and cold"]
    },
    {
      title: "Satin trousers",
      color: "gold",
      styles: ["evening out", "party"],
      weather: ["dry and hot", "dry and medium warm", "rainy and hot", "rainy and medium warm", "dry and cold", "rainy and cold"]
    },
   ],
   Shoes: [
     {
     title: "Buckle sandals",
     color: "black",
     styles: ["casual", "evening out"],
     weather: ["dry and hot", "dry and medium warm", "rainy and hot"]
     },
     {
     title: "Colourblock trainers",
     color: "black & white",
     styles: ["sporty", "casual"],
     weather: ["dry and hot", "dry and medium warm", "rainy and hot", "rainy and medium warm", "dry and cold", "rainy and cold"]
     },
     {
      title: "Heels",
      color: "black",
      styles: ["evening out", "party"],
      weather: ["dry and hot", "dry and medium warm", "rainy and hot", "rainy and medium warm"]
      },
      {
        title: "Tribal wedges",
        color: "multi",
        styles: ["evening out", "casual"],
        weather: ["dry and hot", "dry and medium warm", "rainy and hot", "rainy and medium warm"]
      },
      {
        title: "Sandal heels",
        color: "pink",
        styles: ["evening out", "party"],
        weather: ["dry and hot", "dry and medium warm", "rainy and hot", "rainy and medium warm"]
      },
      {
        title: "Crochet trainers",
        color: "beige",
        styles: ["casual", "evening out"],
        weather: ["dry and hot", "dry and medium warm", "rainy and hot", "rainy and medium warm", "dry and cold", "rainy and cold"]
      },
      {
        title: "Tropical sandals",
        color: "multi",
        styles: ["casual", "evening out"],
        weather: ["dry and hot", "dry and medium warm", "rainy and hot", "rainy and medium warm"]
      },
      {
        title: "Wedges",
        color: "cream",
        styles: ["casual", "comfy"],
        weather: ["dry and hot", "dry and medium warm", "rainy and hot", "rainy and medium warm"]
      },
      {
        title: "Trainers",
        color: "cream",
        styles: ["sporty", "casual"],
        weather: ["dry and hot", "dry and medium warm", "rainy and hot", "rainy and medium warm", "dry and cold", "rainy and cold"]

      },
      {
        title: "Metallic sandals",
        color: "gold",
        styles: ["evening out", "party"],
        weather: ["dry and hot", "dry and medium warm", "rainy and hot", "rainy and medium warm"]
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

    #  add category folder path /bottoms
    file = File.open(Rails.root.join("app/assets/images/#{key.downcase}/#{item[:title]}.png"))
    # file = File.open(Rails.root.join("app/assets/images/dresses/hm_dress.jpeg"))
    new_item.photo.attach(io: file, filename: 'image.jpeg', content_type: 'image/jpeg')

    new_item.save!

    item[:styles].each do |style|
      ItemStyle.create(item: new_item, style: Style.find_by_title(style))
    end

    item[:weather].each do |weather|
      ItemsWeather.create(item: new_item, name: weather)
    end
  end
end
