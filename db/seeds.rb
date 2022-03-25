# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Seedings...'

# Customer seeds
Customer.create(first_name: 'Michelle', last_name: 'Jordan', phone: '1234567890', email: 'm@mail.com', note: 'Note 1', created_at: 14.days.ago, updated_at: 7.days.ago)
Customer.create(first_name: 'Lori', last_name: 'Robinson', phone: '1234567891', email: 'l@mail.com', note: 'Note 2', created_at: 13.days.ago, updated_at: 7.days.ago)
Customer.create(first_name: 'Harriet', last_name: 'Rathbun', phone: '1234567892', email: 'h@mail.com', note: 'Note 3', created_at: 12.days.ago, updated_at: 7.days.ago)
puts "Created #{Customer.count} customers"

# Supplier seeds
Supplier.create(company_name: 'Supplier Corp', address: '123 Fake St. Toronto', notes: 'Notes', created_at: 14.days.ago, updated_at: 7.days.ago)
Supplier.create(company_name: 'Supplier Corp 2', address: '127 Fake St. Toronto', notes: 'Notes', created_at: 14.days.ago, updated_at: 7.days.ago)
Supplier.create(company_name: 'Supplier Corp 3', address: '131 Fake St. Toronto', notes: 'Notes', created_at: 14.days.ago, updated_at: 7.days.ago)
puts "Created #{Supplier.count} suppliers"

# Deliverer seeds
Deliverer.create(name: 'Mike', phone: '1234567898', created_at: 14.days.ago, updated_at: 7.days.ago)
Deliverer.create(name: 'Bella', phone: '1234567897', created_at: 14.days.ago, updated_at: 7.days.ago)
Deliverer.create(name: 'Sarah', phone: '1234567896', created_at: 14.days.ago, updated_at: 7.days.ago)
puts "Created #{Deliverer.count} deliverers"

# Oven seeds
Oven.create(details: 'Small oven', created_at: 14.days.ago, updated_at: 7.days.ago)
Oven.create(details: 'Large oven', created_at: 14.days.ago, updated_at: 7.days.ago)
puts "Created #{Oven.count} ovens"

# Order seeds
# Order.create(customer_id: 1, confirmed_at: 1.days.ago, pickup_at: 7.days.from_now, delivery: true, delivery_charge: 50.00, status: 'Pending order', payment_received: 'Pending', payment_type: 'Cash', created_at: 5.days.ago, updated_at: 5.days.ago)
# Order.create(customer_id: 2, confirmed_at: 1.days.ago, pickup_at: 7.days.from_now, delivery: true, delivery_charge: 50.00, status: 'Pending order', payment_received: 'Pending', payment_type: 'Cash', created_at: 5.days.ago, updated_at: 5.days.ago)
# Order.create(customer_id: 3, confirmed_at: 1.days.ago, pickup_at: 7.days.from_now, delivery: false, delivery_charge: 0.00, status: 'Pending order', payment_received: 'Pending', payment_type: 'Cash', created_at: 5.days.ago, updated_at: 5.days.ago)
# puts "Created #{Order.count} orders"

# # Delivery seeds
# Delivery.create(order_id: 1, deliverer_id: 1, location: 'Toronto', address: '12 Street Ave', created_at: 14.days.ago, updated_at: 7.days.ago)
# Delivery.create(order_id: 2, deliverer_id: 1, location: 'Toronto', address: '12 Street Ave', created_at: 14.days.ago, updated_at: 7.days.ago)
# puts "Created #{Delivery.count} deliveries"

# # Lechon seeds
# Lechon.create(supplier_id: 1, order_id: 1, oven_id: 1, size: 'Small', weight: 45, base_price: 100.00, sell_price: 200.00, ordered: false, created_at: 4.days.ago, updated_at: 4.days.ago)
# Lechon.create(supplier_id: 1, order_id: 2, oven_id: 1, size: 'Small', weight: 45, base_price: 100.00, sell_price: 200.00, ordered: false, created_at: 4.days.ago, updated_at: 4.days.ago)
# Lechon.create(supplier_id: 1, order_id: 3, oven_id: 1, size: 'Small', weight: 45, base_price: 100.00, sell_price: 200.00, ordered: false, created_at: 4.days.ago, updated_at: 4.days.ago)
# Lechon.create(supplier_id: 1, order_id: 3, oven_id: 2, size: 'Large', weight: 70, base_price: 200.00, sell_price: 300.00, ordered: false, created_at: 4.days.ago, updated_at: 4.days.ago)
# puts "Created #{Lechon.count} lechons"

puts 'Seeding done.'