require "active_record"
require "yaml"
require "mysql2"

APP_ENV= ENV.fetch("APP_ENV") { "development" }
ActiveRecord::Base.establish_connection(YAML.load(File.open("/app/config/database.yml"))[APP_ENV])

# Requiring libs
require_relative "./client.rb"
require_relative "./database_insurance.rb"
require_relative "./mapper.rb"

# Requiring models
require_relative "../models/application_record.rb"
require_relative "../models/visit.rb"
require_relative "../models/pageview.rb"
