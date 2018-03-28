class Place < ApplicationRecord
  validates :name, :type_of_place, :address, presence: true
  has_many :details
  has_many :users
end
