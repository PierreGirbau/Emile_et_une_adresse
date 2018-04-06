class Place < ApplicationRecord
  include PgSearch
    pg_search_scope :search,
      against: [ :address, :type_of_place ]

  validates :type_of_place, :address, :name, presence: true
  has_many :details, dependent: :destroy
  has_many :users
end
