# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

customers = [
  {name: 'Venkat', email: 'venkat@gmail.com'},
  {name: 'Balaji', email: 'balaji@gmail.com'},
  {name: 'Test Customer 1', email: 'test_customer_1@gmail.com'}
]
customers.each do |customer|
  Customer.find_or_create_by(customer)
end
default_working_hours = {"Monday":{ "type": "open","timing": [{"end": "10:00 AM", "start": "6:00 PM"}]}, "Tuesday":{ "type": "open","timing": [{"end": "10:00 AM", "start": "6:00 PM"}]}, "Wednesday":{ "type": "open","timing": [{"end": "10:00 AM", "start": "6:00 PM"}]}, "Thursday":{ "type": "open","timing": [{"end": "10:00 AM", "start": "6:00 PM"}]}, "Friday":{ "type": "open","timing": [{"end": "10:00 AM", "start": "6:00 PM"}]}, "Saturday":{ "type": "closed","timing": []}, "Sunday":{ "type": "closed","timing": []}}

companies = [
  { name:'Cut & Smile', gst_in: "22AAAAA1000A1Z5", pan: "AAAAA1000A", address: 'No: 11, New Street, T.nagar, Chennai-600017', chairs: 5, working_hours: default_working_hours },
  { name: 'New Look', gst_in: "22AAAAA2000A1Z5", pan: "AAAAA2000A", address:'Plot: 3/4 , Patel Street, West Mambalam, Chennai-600033', chairs:7, working_hours:  default_working_hours },
  { name: 'Tony & Guy', gst_in: "22AAAAA3000A1Z5", pan: "AAAAA3000A", address:'New No: 18 , Kodambakam Main Road, Kodambakam, Chennai-600024', chairs:3, working_hours: default_working_hours }
]

companies.each do |company|
  Company.find_or_create_by(company)
end

services = [
  {name: "Hair Cut", company_id: 1, duration: 30, price: 100},
  {name: "Shaving", company_id: 1, duration: 20, price: 50},
  {name: "Facial", company_id: 1, duration: 60, price: 150},
  {name: "Hair Cut", company_id: 2, duration: 20, price: 200},
  {name: "Shaving", company_id: 2, duration: 10, price: 100},
  {name: "Facial", company_id: 2, duration: 90, price: 300},
  {name: "Hair Cut", company_id: 3, duration: 60, price: 300},
  {name: "Shaving", company_id: 3, duration: 30, price: 250},
  {name: "Facial", company_id: 3, duration: 70, price: 1000}
]


services.each do |service|
  Service.find_or_create_by(service)
end

if Basket.all.count < 50
  (1..50).each do |count|
    Basket.create(capacity:  rand(2..27))
  end
end