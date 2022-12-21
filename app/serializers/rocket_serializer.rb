class RocketSerializer < ActiveModel::Serializer

  has_many :launches
  belongs_to :rocket_configuration

  attributes :id
end
