class Launch < ApplicationRecord
  has_one :launch_service_provider, dependent: :destroy
  has_one :launch_status, dependent: :destroy
  has_one :mission, dependent: :destroy
  has_one :pad, dependent: :destroy
  has_one :rocket, dependent: :destroy
end
