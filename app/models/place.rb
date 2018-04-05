class Place < ApplicationRecord
  include PgSearch
    pg_search_scope :search_by_address,
      against: [ :address ]

  validates :type_of_place, :address, :name, presence: true
  has_many :details, dependent: :destroy
  has_many :users
end
