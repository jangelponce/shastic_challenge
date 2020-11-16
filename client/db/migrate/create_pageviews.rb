class CreatePageviews < ActiveRecord::Migration[6.0]
  def change
    create_table :pageviews, id: false do |t|
      t.bigint :visit_id
      t.string :title
      t.string :position
      t.text :url
      t.string :time_spent
      t.decimal :timestamp
    end
  end
end
