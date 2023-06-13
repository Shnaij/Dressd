class Item < ApplicationRecord
  belongs_to :user
  has_many :items_weathers
  has_many :item_styles, dependent: :destroy
  has_many :styles, through: :item_styles, dependent: :destroy
  has_many :outfit_items, dependent: :destroy
  has_many :outfits, through: :outfit_items, dependent: :destroy
  has_one_attached :photo

  CATEGORIES = ['Dresses', 'Tops', 'Bottoms', 'Shoes']
  STYLES = ['sporty', 'casual', 'comfy', 'party', 'evening out']

  validates :title, uniqueness: true
  validates :category, inclusion: { in: CATEGORIES }

  include PgSearch::Model
  # pg_search_scope :search_two_models,
    # multisearchable against: [:title, :brand, :color, :category]

  pg_search_scope :items_search,
    against: [:title, :brand, :color, :category, :original_price],
    associated_against: {
      styles: :title
    },
    using: {
      tsearch: { prefix: true }
    }
end
