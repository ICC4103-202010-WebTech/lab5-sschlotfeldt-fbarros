namespace :db do
  task :populate_fake_data => :environment do
    # If you are curious, you may check out the file
    # RAILS_ROOT/test/factories.rb to see how fake
    # model data is created using the Faker and
    # FactoryBot gems.
    puts "Populating database"
    # 10 event venues is reasonable...
    create_list(:event_venue, 10)
    # 50 customers with orders should be alright
    create_list(:customer_with_orders, 50)
    # You may try increasing the number of events:
    create_list(:event_with_ticket_types_and_tickets, 3)
  end
  task :model_queries => :environment do
    # Sample query: Get the names of the events available and print them out.
    # Always print out a title for your query
    puts("Query 0: Sample query; show the names of the events available")
    result = Event.select(:name).distinct.map { |x| x.name }
    puts(result)
    puts("EOQ") # End Of Query -- always add this line after a query.

    #1.
    Customer.find(1).tickets.count
    #2.
    Event.joins(ticket_types: {tickets: {order: :customer}}).where(customers: {id: 1}).distinct.count
    #3.
    Event.joins(ticket_types: {tickets: {order: :customer}}).where(customers: {id: 1}).select("name").distinct.map {|x| x.name}
    #4.
    Event.joins(ticket_types: :tickets).where(id:1).count
    #5.
    Event.joins(ticket_types: :tickets).where(id: 1).select("ticket_types.ticket_price").sum("ticket_price")
    #6.
    Event.joins(ticket_types: {tickets: {order: :customer}}).where(customers: {gender: "f"}).distinct.map {|x| x.name}.max
    #7.
    Event.joins(ticket_types: {tickets: {order: :customer}}).where("customers.gender= 'm' and customers.age>= 18 and customers.age<= 31").distinct.map {|x| x.name}.max

    # Id = You can try with whichever id you'd like to try.
  end

end