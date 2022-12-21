# API Key generator
# This task generates API keys and stores them on the database to consult
# in the application controllers.

require 'securerandom'


namespace :api_key do
  desc "Generate API keys"
  task generate: :environment do
    # create 10 API Keys in the database
    (1..10).each do |i|
        ApiKey.create(value: SecureRandom.urlsafe_base64(32))
    end
  end

end
