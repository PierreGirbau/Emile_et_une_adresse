class Detail < ApplicationRecord
  belongs_to :user
  belongs_to :place
  has_many :categories
end
