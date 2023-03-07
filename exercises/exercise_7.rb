require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

=begin
Ask the user for a store name (store it in a variable)
Attempt to create a store with the inputted name but leave out the other
fields (annual_revenue, mens_apparel, and womens_apparel)
Display the error messages provided back from ActiveRecord to the user (one on each line)
after you attempt to save/create the record
=end

puts "Please enter the name of the store."
print "> "
@store_name = $stdin.gets.chomp

store = Store.create(name: @store_name, annual_revenue: 100000, mens_apparel: true, womens_apparel: true)
# store = Store.create(name: @store_name)

p store.errors.size
store.errors.objects.each { |error| puts error.full_message }
