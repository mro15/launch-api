class Orbit < ApplicationRecord
  belongs_to :mission, optional: true
end
