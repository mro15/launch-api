class PadSerializer < ActiveModel::Serializer

  has_many :launches
  belongs_to :location

  attributes \
  :id,
  :url,
  :agency_id,
  :name,
  :info_url,
  :wiki_url,
  :map_url,
  :latitude,
  :longitude,
  :map_image,
  :total_launch_count,
  :location_id,
  :created_at,
  :updated_at
end
