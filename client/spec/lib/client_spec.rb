require "spec_helper"

describe Client do
  describe ".visits" do 
    it "returns array of hashes" do
      visits = Client.visits
      expect(visits).to be_a(Array)
      expect(visits[0]).to be_a(Hash)
    end
  end
end
