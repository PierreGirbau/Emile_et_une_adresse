class Place < ApplicationRecord

  include PgSearch
    pg_search_scope :search,
      against: [ :address, :type_of_place ]

  acts_as_votable

  validates :type_of_place, :name, presence: true
  has_many :details, dependent: :destroy
  has_many :users, through: :details
  has_many :saved_places, dependent: :destroy
  has_many :shared_places, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
