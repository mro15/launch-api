# launch_import
# This task imports the lauchs from the Space Devs API

require 'json'
require 'rest-client'

namespace :launch do
  desc "Import launchs to database"
  task import_launchs: :environment do
    space_devs_url = 'https://ll.thespacedevs.com/2.0.0/launch/'
    max_imports = 10
    limit = 3
    offset = 0
    response = RestClient.get(space_devs_url, {accept: :json, params: {limit: limit, offset: offset}})
    # check response status
    response_status_code = response.code

    if response_status_code == 200
      # parse the first page
      json_response = JSON.parse(response.body)
      total_results = json_response["count"]

      # deal with less entries
      if max_imports > total_results
        max_imports = total_results
      end

      # create db entries

      # handle with the remaining pages
      offset += limit
      while offset < max_imports
        # get the new page
        response = RestClient.get(space_devs_url, {accept: :json, params: {limit: limit, offset: offset}})
        response_status_code = response.code

        if response_status_code == 200
          json_response = JSON.parse(response.body)
          # create db entries

          offset += limit
        else
          p 'Something is wrong with Space devs API. Response code: ' + response_status_code
          break
        end
      end
    else
      p 'Something is wrong with Space devs API. Response code: ' + response_status_code
    end
  end
end
