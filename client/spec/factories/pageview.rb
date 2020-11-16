FactoryBot.define do
  factory :valid_pageview, class: "Pageview" do
    visit_id   { 134849628 }
    title      { "Vehicle Loan Information"}
    position   { "0"}
    url        { "https://apptest.loanspq.com/vl/VehicleLoan.aspx/vehicle-loan-information?lenderref=Meriwest_test&l=1"}
    time_spent { "1"}
    timestamp  { 1537623579 }
  end
end
