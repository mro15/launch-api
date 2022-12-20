class OrbitSerializer < ActiveModel::Serializer

  has_many :missions

  attributes :id, :name, :abbrev, :created_at, :updated_at

end
