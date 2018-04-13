class SavedPlace < ApplicationRecord
  belongs_to :user
  belongs_to :place
  validates :place_id, uniqueness: true
  validates :user_id, uniqueness: true
end
