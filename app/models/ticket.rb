class Ticket < ApplicationRecord
  belongs_to :order
  belongs_to :ticket_type

  # TODO: complete the folowing
  # before_xxxxx :update_stats

  private
    def update_stats
      es = self.ticket_type.event.event_stat
      # TODO: complete in order to update event stats
    end
end
