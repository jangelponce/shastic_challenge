class CreateVisits < ActiveRecord::Migration[6.0]
  def change
    create_table :visits, id: false do |t|
      t.string :evid
      t.string :vendor_site_id
      t.string :vendor_visit_id, primary_key: true
      t.string :visit_ip
      t.string :vendor_visitor_id
    end
  end
end