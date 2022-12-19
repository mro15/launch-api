class Pad < ApplicationRecord
  has_many :launches
  belongs_to :location
end
