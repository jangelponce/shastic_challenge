require "json"
require "curb"

class Client

  API_URL="http://api:4567"

  class << self
    def visits
      response = Curl.get(API_URL + "/response.json")
      JSON.parse(response.body)
    rescue Curl::Err::ConnectionFailedError
      puts "Cannot connect with #{API_URL}"
    end
  end
end
