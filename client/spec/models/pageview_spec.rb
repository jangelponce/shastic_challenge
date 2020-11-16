require "spec_helper"

describe Pageview do
  it "has a valid factory" do
    expect(build(:valid_pageview)).to be_valid
  end
  
  it "creates a valid pageview" do
    expect(build(:valid_pageview).save).to be true
  end

  it "belongs to Visit" do
    expect(Pageview.first).to respond_to(:visit)
  end
end