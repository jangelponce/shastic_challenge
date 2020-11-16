require_relative "initializer.rb"

def call(**kwargs)
  # {
  #   host:     ENV.fetch("DB_HOST") { "mysql" },
  #   username: ENV.fetch("DB_USER") { "root" },
  #   password: ENV.fetch("DB_PASS") { "pass" }
  # }
  DatabaseInsurance.validate
  visits = Mapper.for_visits(Client.visits)
  Visit.create(visits)
  puts "Visits: #{Visit.count}"
  puts "Pageviews: #{Pageview.count}"
  {
    visits: Visit.count,
    pageviews: Pageview.count
  }
  # {
  #   mysql:    ActiveRecord::Base.connection_config
  # }
end
