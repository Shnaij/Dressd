class Item < ApplicationRecord
  belongs_to :user
  has_many :item_styles
  has_many :items_weathers
  has_many :styles, through: :item_styles
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
    against: [:title, :brand, :color, :category],
    associated_against: {
      styles: :title
    },
    using: {
      tsearch: { prefix: true }
    }
end
