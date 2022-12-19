class LaunchStatus < ApplicationRecord
  belongs_to :launch, optional: true
end
