require "initializer"

describe DatabaseInsurance do
  before(:all) do
    DatabaseInsurance.drop_database
  end

  describe ".create_database" do 
    it "creates new MySQL database" do
      expect(DatabaseInsurance.create_database).to be true
    end
  end

  describe ".migrate" do 
    it "migrates table definitions" do
      expect(DatabaseInsurance.migrate).to be true
    end
  end

  describe ".validate" do 
    it "creates and migrates database unless is already set" do
      expect(DatabaseInsurance.validate).to be true
    end
  end

  describe ".drop_database" do 
    it "drops MySQL database" do
      expect(DatabaseInsurance.drop_database).to be true
    end
  end

  after(:all) do
    DatabaseInsurance.validate
  end
end
