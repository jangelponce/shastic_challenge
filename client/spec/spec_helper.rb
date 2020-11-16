require "initializer"
require "factory_bot"

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.find_definitions
    DatabaseInsurance.drop_database
    DatabaseInsurance.validate
  end
end