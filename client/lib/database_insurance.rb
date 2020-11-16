require_relative "../db/migrate/create_pageviews.rb"
require_relative "../db/migrate/create_visits.rb"

class DatabaseInsurance
  attr_reader :session, :config

  def initialize
    @config  = ActiveRecord::Base.connection_config
    @session = initialize_session
  end
  
  def initialize_session
    retries      = 0
    max_retries  = 5
    waiting_secs = 5
    
    begin 
      Mysql2::Client.new(config.slice(:host, :username, :password))
    rescue Mysql2::Error::ConnectionError
      retries += 1
      if max_retries >= retries
        puts "Database not ready yet, waiting #{waiting_secs}s"
        sleep waiting_secs
        puts "Retrying to connect (#{retries}/#{max_retries})..."
        retry
      else
        raise Mysql2::Error::ConnectionError.new("Reached maximum retries, check database availability or try again")
      end
    end
  end

  class << self
    DATABASE = DatabaseInsurance.new
    SESSION  = DATABASE.session
    CONFIG   = DATABASE.config

    def validate 
      unless SESSION.query("SHOW DATABASES LIKE '#{CONFIG[:database]}'").count == 1
        create_database and migrate
      end
      true
    end

    def create_database
      SESSION.query("CREATE DATABASE IF NOT EXISTS #{CONFIG[:database]}")
      true
    end

    def drop_database
      SESSION.query("DROP DATABASE #{CONFIG[:database]}")
      true
    end
    
    def migrate
      CreatePageviews.migrate :up
      CreateVisits.migrate :up
      true
    end
  end
end
