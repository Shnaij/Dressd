class Outfit < ApplicationRecord
  belongs_to :user
  has_many :outfit_items
  has_many :items, through: :outfit_items

  validates :title, uniqueness: true

  def 

  include PgSearch::Model
  pg_search_scope :outfit_search,
    against: [:title],
    associated_against: {
      item: [:title, :brand, :color, :category]
    },
    using: {
      tsearch: { prefix: true }
    }
end
