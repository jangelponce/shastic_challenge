require "active_record"
require "erb"
require "yaml"
require "mysql2"

# We need to establish connection before include DatabaseInsurance
app_env= ENV.fetch("APP_ENV") { "development" }
ActiveRecord::Base.establish_connection(
  YAML.load(ERB.new(File.read("./config/database.yml")).result)[app_env]
)

# Including libs
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require_relative file }

# We need to declare it before include models
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end

# Including models
Dir[File.dirname(__FILE__) + '/models/*.rb'].each {|file| require file }