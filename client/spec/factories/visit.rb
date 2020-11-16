FactoryBot.define do
  factory :valid_visit, class: "Visit" do
    evid              { "3385a27a-cc20-8d98-940a-37dad5a93133" }
    vendor_site_id    { "209" }
    vendor_visit_id   { "134849628" }
    visit_ip          { "24.6.5.33" }
    vendor_visitor_id { "e280af5191b64f18" }
  end

  factory :unvalid_evid_visit, class: "Visit" do
    evid              { "incorrect-evid" }
    vendor_site_id    { "209" }
    vendor_visit_id   { "134849628" }
    visit_ip          { "24.6.5.33" }
    vendor_visitor_id { "e280af5191b64f18" }
  end

  factory :starting_with_evid_visit, class: "Visit" do
    evid              { "evid_3385a27a-cc20-8d98-940a-37dad5a93133" }
    vendor_site_id    { "209" }
    vendor_visit_id   { "134849630" }
    visit_ip          { "24.6.5.33" }
    vendor_visitor_id { "e280af5191b64f18" }
  end

  factory :visit_with_pageviews, class: "Visit" do
    evid              { "3385a27a-cc20-8d98-940a-37dad5a93624" }
    vendor_site_id    { "209" }
    vendor_visit_id   { "134849629" }
    visit_ip          { "24.6.5.33" }
    vendor_visitor_id { "e280af5191b64f18" }
    pageviews_attributes do 
      [{
        title: "Vehicle Loan Information", 
        position: "0", 
        url: "https://apptest.loanspq.com/vl/VehicleLoan.aspx/vehicle-loan-information?lenderref=Meriwest_test&l=1", 
        time_spent: "1", 
        timestamp: 1537623579
      }]
    end
  end
end
