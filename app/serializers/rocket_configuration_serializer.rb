class RocketConfigurationSerializer < ActiveModel::Serializer

  has_many :rockets
  attributes :id, :url, :name, :launch_library_id, :family, :full_name, :full_name, :created_at, :updated_at

end
