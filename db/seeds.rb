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
Customer.create!(customers)

default_working_hours = {"Monday":{ "type": "open","timing": [{"end": "10:00 AM", "start": "6:00 PM"}]}, "Tuesday":{ "type": "open","timing": [{"end": "10:00 AM", "start": "6:00 PM"}]}, "Wednesday":{ "type": "open","timing": [{"end": "10:00 AM", "start": "6:00 PM"}]}, "Thursday":{ "type": "open","timing": [{"end": "10:00 AM", "start": "6:00 PM"}]}, "Friday":{ "type": "open","timing": [{"end": "10:00 AM", "start": "6:00 PM"}]}, "Saturday":{ "type": "closed","timing": []}, "Sunday":{ "type": "closed","timing": []}}

companies = [
  { name:'Cut & Smile', gst_in: 123, pan: 456, address: 'No: 11, New Street, T.nagar, Chennai-600017', chairs: 5, working_hours: default_working_hours },
  { name: 'New Look', gst_in: 789, pan: 122, address:'Plot: 3/4 , Patel Street, West Mambalam, Chennai-600033', chairs:7, working_hours:  default_working_hours },
  { name: 'Tony & Guy', gst_in:133, pan:144, address:'New No: 18 , Kodambakam Main Road, Kodambakam, Chennai-600024', chairs:3, working_hours: default_working_hours }
]

companies.each do |company|
  Company.create!(company)
end











