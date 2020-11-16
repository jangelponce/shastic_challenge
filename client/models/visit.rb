class Visit < ApplicationRecord
  has_many :pageviews, primary_key: :vendor_visit_id

  validates_uniqueness_of :vendor_visit_id, case_sensitive: true
  validates_format_of :evid, with: /\A[A-z0-9]{8}-[A-z0-9]{4}-[A-z0-9]{4}-[A-z0-9]{4}-[A-z0-9]{12}\z/

  accepts_nested_attributes_for :pageviews

  before_validation do
    evid.slice! "evid_"
  end
end