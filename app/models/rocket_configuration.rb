class RocketConfiguration < ApplicationRecord
  belongs_to :rocket, optional: true
end
