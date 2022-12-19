class LaunchServiceProvider < ApplicationRecord
  belongs_to :launch, optional: true
end
