class Item < ApplicationRecord
  belongs_to :user
  has_many :item_styles
  has_many :styles, through: :item_styles
  has_one_attached :photo

  CATEGORIES = ['Dresses', 'Tops', 'Bottoms', 'Shoes']

  validates :title, uniqueness: true
  validates :category, inclusion: { in: CATEGORIES }

  include PgSearch::Model
  multisearchable against: [:title, :brand, :color, :category]
end
