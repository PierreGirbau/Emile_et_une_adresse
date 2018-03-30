class Detail < ApplicationRecord
  belongs_to :user
  belongs_to :place
  has_many :categories, through: :detailed_categories
  has_many :detailed_categories
end
