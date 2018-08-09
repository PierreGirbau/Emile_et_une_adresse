class SharedPlace < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :place
  validates_uniqueness_of :user_id, scope: [:place_id]
end
