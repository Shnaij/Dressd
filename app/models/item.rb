class Item < ApplicationRecord
  belongs_to :user
  has_many :item_styles
  has_many :styles, through: :item_styles
  has_one_attached :photo
end
