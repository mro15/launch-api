# launch_import
# This task imports the lauchs from the Space Devs API

require './lib/create_launch'
require './lib/get_data_from_api'


namespace :launch do
  desc "Import launchs to database"
  task import_launchs: :environment do

    max_imports = 10
    limit = 3
    offset = 0

    api_requester = GetDataFromApi.new(max_imports: max_imports)
    first_page_results = api_requester.get_first_page(limit: limit, offset: offset)

    if first_page_results

      # create db entries
      launch_db_creator = CreateLaunch.new
      first_page_results.each do |entry|
        launch_db_creator.process_launch(entry)
      end

      # handle with the remaining pages
      offset += limit
      while offset < api_requester.max_imports
        any_page_results = api_requester.get_any_page(limit: limit, offset: offset)
        if any_page_results
          any_page_results.each do |entry|
            launch_db_creator.process_launch(entry)
          end
          offset += limit
        else
          break
        end
      end
    end
  end
end
