class DetailedCategory < ApplicationRecord
  belongs_to :category
  belongs_to :detail
end
