class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :host, :meetup_id, :local_date, :local_time, :attendee_count, :ticket_price, :venue_name, :venue_address, :city, :state, :zip, :event_link, :event_description
end
