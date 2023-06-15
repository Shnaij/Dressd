class ItemsWeather < ApplicationRecord
  belongs_to :item
  NAMES = ["dry and hot", "dry and medium warm", "dry and cold", "rainy and hot", "rainy and medium warm", "rainy and cold"]
  ICONS = ['<i class="fa-regular fa-sun"></i>', '<i class="fa-solid fa-cloud-sun"></i>', '<i class="fa-solid fa-wind"></i>', '<i class="fa-solid fa-cloud-sun-rain"></i>', '<i class="fa-solid fa-cloud-rain"></i>', '<i class="fa-solid fa-cloud-showers-water"></i>']

end
