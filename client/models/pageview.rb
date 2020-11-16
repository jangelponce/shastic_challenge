class Pageview < ApplicationRecord
  belongs_to :visit, primary_key: :vendor_visit_id
end