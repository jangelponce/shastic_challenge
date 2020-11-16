require "json"
require "curb"

class Client
  class << self
    def visits
      api_visits_url= ENV.fetch("API_VISITS_URL") { "http://api:4567/response.json" }
      response = Curl.get(api_visits_url)
      JSON.parse(response.body)
    rescue Curl::Err::ConnectionFailedError
      puts "Cannot connect with #{api_visits_url}"
    end
  end
end