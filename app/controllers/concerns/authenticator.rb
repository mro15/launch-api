# Authenticator concern

module Authenticator
  extend ActiveSupport::Concern

  included do
    before_action :authenticate
  end

  private
  def authenticate
    # check if the X-API-KEY is present in headers and if the value
    # corresponds to an API key in the database
    if request.headers['X-API-KEY'].nil?
      render json: {'error': 'missing api key'}, status: :unauthorized
    else
      unless !ApiKey.where(value: request.headers['X-API-KEY']).empty?
        render json: {'error': 'invalid api key'}, status: :unauthorized
      end
    end
  end
end
