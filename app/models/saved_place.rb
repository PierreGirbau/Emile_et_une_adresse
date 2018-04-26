class SavedPlace < ApplicationRecord
  belongs_to :user
  belongs_to :place
  validates_uniqueness_of :user_id, scope: [:place_id]
end
