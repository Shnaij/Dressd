class Style < ApplicationRecord
  has_many :item_styles
  has_many :items, through: :item_styles

  include PgSearch::Model
  multisearchable against: [:title]
end
