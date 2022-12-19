class Rocket < ApplicationRecord
  has_many :launches
  belongs_to :rocket_configuration
end
