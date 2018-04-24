class SavedPlace < ApplicationRecord
  belongs_to :user
  belongs_to :place
  # validates :place_id, uniqueness: true
  # validates :user_id, uniqueness: true
  validates_uniqueness_of :user_id, scope: [:place_id]
end
