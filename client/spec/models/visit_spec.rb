require "spec_helper"

describe Visit do
  it "has a valid factory" do
    expect(build(:valid_visit)).to be_valid
  end
  
  it "creates a valid visit" do
    expect(build(:valid_visit).save).to be true
  end

  it "validates evid format" do 
    expect(build(:unvalid_evid_visit).save).to be false
  end

  it "validates uniqueness vendor_visit_id" do 
    expect(build(:valid_visit).save).to be false
  end

  it "removes evid_ from vendor_visit_id" do 
    expect(build(:starting_with_evid_visit).save).to be true
  end

  it "accepts nested attributes for pageviews" do
    expect(build(:visit_with_pageviews).save).to be true
  end

  it "has one-to-many relation with Pageview" do
    expect(Visit.first).to respond_to(:pageviews)
  end
end