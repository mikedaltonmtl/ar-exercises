require_relative '../setup'

=begin
Exercise 1: Employee passwords
Scenario: We want to be able to give employees a password (string) that is
auto-generated when their record is created in the database.
=end

puts "Exercise 1"
puts "----------"

burnaby = Store.create(
  name: "Burnaby",
  annual_revenue: 300_000,
  mens_apparel: true,
  womens_apparel: true
)

employee1 = burnaby.employees.create(first_name: "Michael", last_name: "Scott", hourly_rate: 100)
puts "Employee #{employee1.first_name} #{employee1.last_name}, password #{employee1.password}"