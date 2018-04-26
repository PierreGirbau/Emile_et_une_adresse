class Detail < ApplicationRecord
  belongs_to :user
  belongs_to :place
  validates :season, :comment, :price, presence: true
  validates :comment, length: { maximum: 60,
   too_long: "%{count} caractères, c'est le maximum autorisé désolé" }
end
