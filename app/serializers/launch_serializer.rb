class LaunchSerializer < ActiveModel::Serializer

  belongs_to :rocket
  belongs_to :launch_status
  belongs_to :launch_service_provider
  belongs_to :mission
  belongs_to :pad

  attributes \
    :id,
    :status,
    :url,
    :launch_library_id,
    :slug,
    :name,
    :net,
    :window_end,
    :window_start,
    :inhold,
    :tbddate,
    :tbdtime,
    :probability,
    :holdreason,
    :failreason,
    :hashtag,
    :webcast_live,
    :image,
    :infographic,
    :program,
    :imported_t,
    :created_at,
    :updated_at

end
