require 'json'
require 'rest-client'


class GetDataFromApi

  def initialize(max_imports: 3)
    @space_devs_url = 'https://ll.thespacedevs.com/2.0.0/launch/'
    @max_imports = max_imports
  end

  def max_imports
    @max_imports
  end

  def get_first_page(limit: 3, offset: 0)
    api_data = get_api_data(limit: limit, offset: offset)
    if not api_data.nil?
      total_results = api_data["count"]

      # deal with less entries
      if @max_imports > total_results
        @max_imports = total_results
      end
      return api_data["results"]
    end
    return nil
  end

  def get_any_page(limit: , offset: )
    api_data = get_api_data(limit: limit, offset: offset)
    if not api_data.nil?
      return api_data["results"]
    end
    return nil
  end

  def get_api_data(limit: 3, offset: 0)
    response = RestClient.get(@space_devs_url, {accept: :json, params: {limit: limit, offset: offset}})

    # check response status
    response_status_code = response.code

    if response_status_code == 200
      json_response = JSON.parse(response.body)
      return json_response
    else
      p 'Something is wrong with Space devs API. Response code: ' + response_status_code
    end
    return nil
  end

end
