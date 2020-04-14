class CreateTicketTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :ticket_types do |t|
      t.integer :ticket_price
      t.references :event
      t.timestamps
    end
  end
end
