class Place < ApplicationRecord
  validates :type_of_place, :address, presence: true
  has_many :details, dependent: :destroy
  has_many :users
end
