class Weather < ApplicationRecord
  validates :temperature, presence: true
  validates :description, presence: true
  validates :city, presence: true
end
