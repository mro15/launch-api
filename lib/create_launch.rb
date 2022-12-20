require 'date'

class CreateLaunch

  def create_launch_object(entry)
    launch = Launch.where(id: entry['id']).first_or_initialize
    launch.url = entry['url'].present? ? entry['url'] : ""
    launch.launch_library_id = entry['launch_library_id'].present? ? entry['launch_library_id'] : nil
    launch.slug = entry['slug'].present? ? entry['slug'] : ""
    launch.name = entry['name'].present? ? entry['name'] : ""
    launch.net = entry['net'].present? ? entry['net'] : ""
    launch.window_end = entry['window_end'].present? ? entry['window_end'] : ""
    launch.window_start = entry['window_start'].present? ? entry['window_start'] : ""
    launch.inhold = entry['inhold'].present? ? entry['inhold'] : false
    launch.tbdtime = entry['tbdtime'].present? ? entry['tbdtime'] : false
    launch.tbddate = entry['tbddate'].present? ? entry['tbddate'] : false
    launch.probability = entry['probability'].present? ? entry['probability'] : 0
    launch.holdreason = entry['holdreason'].present? ? entry['holdreason'] : ""
    launch.failreason = entry['failreason'].present? ? entry['failreason'] : ""
    launch.hashtag = entry['hashtag'].present? ? entry["hashtag"] : ""
    launch.webcast_live = entry['webcast_live'].present? ? entry['webcast_live'] : false
    launch.image = entry['image'].present? ? entry['image'] : ""
    launch.infographic = entry['infographic'].present? ? entry['infographic'] : ""
    launch.program = entry['program'].present? ? entry['program'] : ""
    launch.status = 2 # published
    launch.imported_t = DateTime.current()
    launch
  end

  def create_launch_status_object(launch_status_data)
    launch_status = LaunchStatus.where(id: launch_status_data['id']).first_or_initialize
    launch_status.name = launch_status_data['name']
    launch_status.save
    launch_status
  end

  def create_launch_service_provider_object(launch_service_provider_data)
    launch_service_provider = LaunchServiceProvider.where(id: launch_service_provider_data['id']).first_or_initialize
    launch_service_provider.url = launch_service_provider_data['url']
    launch_service_provider.name = launch_service_provider_data['name']
    launch_service_provider.service_provider_type = launch_service_provider_data['type']
    launch_service_provider.save
    launch_service_provider
  end

  def create_rocket_object(rocket_data)
    rocket = Rocket.where(id: rocket_data["id"]).first_or_initialize
    # RocketConfiguration
    if rocket_data["configuration"].present?
      rocket.rocket_configuration = create_rocket_configuration_object(rocket_data["configuration"])
    end
    rocket.save
    rocket
  end

  def create_rocket_configuration_object(rocket_configuration_data)
    rocket_configuration = RocketConfiguration.where(id: rocket_configuration_data["id"]).first_or_initialize
    rocket_configuration.launch_library_id = rocket_configuration_data["launch_library_id"].present? ? rocket_configuration_data["launch_library_id"] : nil
    rocket_configuration.url = rocket_configuration_data["url"].present? ? rocket_configuration_data["url"] : ""
    rocket_configuration.name = rocket_configuration_data["name"].present? ? rocket_configuration_data["name"] : ""
    rocket_configuration.family = rocket_configuration_data["family"].present? ? rocket_configuration_data["family"] : ""
    rocket_configuration.full_name = rocket_configuration_data["full_name"].present? ? rocket_configuration_data["full_name"] : ""
    rocket_configuration.variant = rocket_configuration_data["variant"].present? ? rocket_configuration_data["variant"] : ""
    rocket_configuration.save
    rocket_configuration
  end

  def create_mission_object(mission_data)
    mission = Mission.where(id: mission_data["id"]).first_or_initialize
    mission.launch_library_id = mission_data["launch_library_id"].present? ? mission_data["launch_library_id"] : nil
    mission.name = mission_data["name"].present? ? mission_data["name"] : ""
    mission.description = mission_data["description"].present? ? mission_data["description"] : ""
    mission.launch_designator = mission_data["launch_designator"].present? ? mission_data["launch_designator"] : ""
    mission.mission_type = mission_data["type"].present? ? mission_data["type"] : ""
    # Orbit
    if mission_data["orbit"].present?
      mission.orbit = create_orbit_object(mission_data["orbit"])
    end
    mission.save
    mission
  end

  def create_orbit_object(orbit_data)
    orbit = Orbit.where(id: orbit_data["id"]).first_or_initialize
    orbit.name = orbit_data["name"].present? ? orbit_data["name"] : ""
    orbit.abbrev = orbit_data["abbrev"].present? ? orbit_data["abbrev"] : ""
    orbit.save
    orbit
  end

  def process_launch(entry)
    # Launch
    launch = create_launch_object(entry)

    # LaunchStatus
    if entry['status'].present?
      launch.launch_status = create_launch_status_object(entry['status'])
    end

    # LaunchServiceProvider
    if entry["launch_service_provider"].present?
      launch.launch_service_provider = create_launch_service_provider_object(entry["launch_service_provider"])
    end

    #Rocket
    if entry["rocket"].present?
      launch.rocket = create_rocket_object(entry["rocket"])
    end

    # Mission
    if entry["mission"].present?
      launch.mission = create_mission_object(entry["mission"])
    end

    if launch.save
      p 'Launch id: ' + launch.id + ' successfully imported to database'
    else
      p 'Error: ' + launch.errors.full_messages
    end

  end

end
