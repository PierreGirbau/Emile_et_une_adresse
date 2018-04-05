class Place < ApplicationRecord
  include PgSearch
    pg_search_scope :search_by_address,
      against: [ :address ],
      using: {
            tsearch: { prefix: true }
          }

    pg_search_scope :search_by_type,
      against: [ :type_of_place ],
      using: {
            tsearch: { prefix: true }
          }

  validates :type_of_place, :address, :name, presence: true
  has_many :details, dependent: :destroy
  has_many :users, through: :details
end
