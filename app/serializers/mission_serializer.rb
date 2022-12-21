class MissionSerializer < ActiveModel::Serializer
  has_many :launches
  belongs_to :orbit

  attributes :id, :launch_library_id, :name, :description, :launch_designator, :mission_type, :orbit_id, :created_at, :updated_at
end
