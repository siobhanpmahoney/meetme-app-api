class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :host
      t.string :meetup_id
      t.string :local_date
      t.string :local_time
      t.integer :attendee_count
      t.integer :ticket_price
      t.string :venue_name
      t.string :venue_address
      t.string :city
      t.string :state
      t.string :zip
      t.string :event_link
      t.text :event_description

      t.timestamps
    end
  end
end
