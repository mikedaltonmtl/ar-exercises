require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'

puts "Exercise 5"
puts "----------"

=begin
Exercise 5: Calculations
Output the total revenue for the entire company (all stores), using Active Record's .sum calculation method.
On the next line, also output the average annual revenue for all stores.
Output the number of stores that are generating $1M or more in annual sales.
Hint: Chain together where and size (or count) Active Record methods.
=end

@total_revenue = Store.sum("annual_revenue")
puts "Total sum of Revenue: #{@total_revenue}"

@average_revenue = Store.average("annual_revenue")
puts "Average Annual Revenue: #{@average_revenue}"

@big_stores = Store
  .where("annual_revenue > 1000000")
  .size

puts "Number of stores generating $1M or more in annual sales: #{@big_stores}"