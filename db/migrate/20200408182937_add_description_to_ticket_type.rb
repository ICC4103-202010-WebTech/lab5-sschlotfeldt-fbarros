class AddDescriptionToTicketType < ActiveRecord::Migration[6.0]
  def change
    add_column :ticket_types, :description, :string
  end
end
