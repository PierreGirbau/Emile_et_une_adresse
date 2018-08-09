class Detail < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :place, optional: true
  validates :season, :type_of_place, presence: true
end
