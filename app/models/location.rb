class Location < ApplicationRecord
  belongs_to :pad, optional: true
end
