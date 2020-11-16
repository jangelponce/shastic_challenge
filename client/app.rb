require_relative "initializer.rb"

def call
  DatabaseInsurance.validate
  visits = Mapper.for_visits(Client.visits)
  Visit.create(visits)
  puts "Visits: #{Visit.count}"
  puts "Pageviews: #{Pageview.count}"
end
