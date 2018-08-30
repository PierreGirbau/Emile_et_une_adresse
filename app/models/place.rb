class Place < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  include PgSearch
    pg_search_scope :search,
      against: [:address, :type_of_place]

  acts_as_votable

  has_many :details, dependent: :destroy
  has_many :users, through: :details
  has_many :saved_places, dependent: :destroy
  has_many :shared_places, dependent: :destroy

  validates :comment, length: { maximum: 150,
   too_long: "%{count} caractères, c'est le maximum autorisé désolé" }

  validates :comment, :price, :name, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def table?
    type_of_place == 'Une bonne table'
  end

  def drink?
    type_of_place == 'Un bon verre'
  end

  def club?
    type_of_place == 'Du bon son'
  end
end
