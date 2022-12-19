class Mission < ApplicationRecord
  belongs_to :mission, optional: true
  has_one :orbit, dependent: :destroy
end
