class Mapper
  class << self

    def visit_mapping
      {
        'referrerName'  => :evid,
        'idSite'        => :vendor_site_id,
        'idVisit'       => :vendor_visit_id,
        'visitIp'       => :visit_ip,
        'visitorId'     => :vendor_visitor_id,
        'actionDetails' => :pageviews_attributes
      }
    end

    def pageview_mapping
      {
        'url'       => :url,
        'pageTitle' => :title,
        'timeSpent' => :time_spent,
        'timestamp' => :timestamp
      }
    end

    def for_visits raw
      raw.map do |item|
        visit_mapping.map do |k, v|
          if k == "actionDetails"
            item[k].sort_by! { |i| i["timestamp"]}
            pageviews = item[k].each_with_index.map do |detail, index|
              pageview_mapping.map do |l, w|
                [w, detail[l]]
              end.to_h.update(position: index)
            end
            [v, pageviews]
          else
            [v, item[k]]
          end
        end.to_h
      end
    end
  end
end