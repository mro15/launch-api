class Rocket < ApplicationRecord
  has_one :rocket_configuration, dependent: :destroy
end
