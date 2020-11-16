require "spec_helper"

describe Mapper do
  it "has visit mapping as requested" do
    expect(Mapper.visit_mapping).to eq({
      'referrerName'  => :evid,
      'idSite'        => :vendor_site_id,
      'idVisit'       => :vendor_visit_id,
      'visitIp'       => :visit_ip,
      'visitorId'     => :vendor_visitor_id,
      'actionDetails' => :pageviews_attributes
    })
  end

  it "has pageview mapping as requested" do
    expect(Mapper.pageview_mapping).to eq({
      'url'       => :url,
      'pageTitle' => :title,
      'timeSpent' => :time_spent,
      'timestamp' => :timestamp
    })
  end

  describe ".for_visits" do
    visits = Mapper.for_visits Client.visits
    visit  = visits[0]

    it "maps to valid structure" do
      expect(visit).to include(:evid, :vendor_site_id, :vendor_visit_id, :visit_ip, :vendor_visitor_id, :pageviews_attributes)
    end

    it "adds pageview_attributes with valid structure" do
      expect(visit[:pageviews_attributes][0]).to include(:url, :title, :time_spent, :timestamp, :position)
    end

    it "adds pageview_attributes sorted by timestamp" do
      timestamps = visit[:pageviews_attributes].collect {|v| v[:timestamp]}
      expect(timestamps).to eq(timestamps.sort)
    end

    it "adds position field sorted" do
      positions = visit[:pageviews_attributes].collect {|v| v[:position]}
      expect(positions).to eq(positions.sort)
    end
  end
end
