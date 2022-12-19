class Launch < ApplicationRecord
  belongs_to :rocket, optional: true
  belongs_to :launch_status, optional: true
  belongs_to :launch_service_provider, optional: true
  belongs_to :mission, optional: true
  enum status: [:draft, :trash, :published]
end
