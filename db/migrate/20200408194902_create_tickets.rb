class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.references :ticket_type
      t.references :order
      t.timestamps
    end
  end
end
