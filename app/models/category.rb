class Category < ApplicationRecord
  has_many :detailed_categories
  CATEGORIES = ["Boire un verre", "Danser", "Kiffer"]
end
