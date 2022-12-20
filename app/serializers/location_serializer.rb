class LocationSerializer < ActiveModel::Serializer

  has_many :pads

  attributes \
    :id,
    :url,
    :name,
    :country_code,
    :map_image,
    :total_launch_count,
    :total_landing_count,
    :created_at,
    :updated_at
end
