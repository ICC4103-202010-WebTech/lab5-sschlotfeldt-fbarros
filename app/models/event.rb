class Event < ApplicationRecord
  belongs_to :event_venue
  has_one :event_stat
  has_many :ticket_types
end
