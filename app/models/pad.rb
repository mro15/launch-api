class Pad < ApplicationRecord
  belongs_to :launch, optional: true
  has_one :location, dependent: :destroy
end
