class Mission < ApplicationRecord
  has_many :launches
  belongs_to :orbit
end
