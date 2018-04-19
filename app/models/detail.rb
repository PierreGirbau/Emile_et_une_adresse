class Detail < ApplicationRecord
  belongs_to :user
  belongs_to :place
  validates :season, :comment, :price, presence: true
  validates :comment, length: { maximum: 60,
   too_long: "%{count} caractères, c'est le maximum autorisé désolé" }
  has_many :categories, through: :detailed_categories
  has_many :detailed_categories
end
