class Outfit < ApplicationRecord
  belongs_to :user
  has_many :outfit_items, dependent: :destroy
  has_many :items, through: :outfit_items
  belongs_to :style, optional: true

  validates :title, presence: true

  include PgSearch::Model
  pg_search_scope :outfit_search,
    against: [:title],
    associated_against: {
      items: [:title, :brand, :color, :category],
      style: [:title] # can I write it like this?
    },
    using: {
      tsearch: { prefix: true }
    }
end
