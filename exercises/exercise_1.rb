require_relative '../setup'

puts "Exercise 1"
puts "----------"

=begin
  create_table :stores do |t|
    t.column :name, :string
    t.column :annual_revenue, :integer
    t.column :mens_apparel, :boolean
    t.column :womens_apparel, :boolean
    t.timestamps null: false
  end

Use Active Record's create class method multiple times to create 3 stores in the database:
Burnaby (annual_revenue of 300000, carries men's and women's apparel)
Richmond (annual_revenue of 1260000 carries women's apparel only)
Gastown (annual_revenue of 190000 carries men's apparel only)

Output (puts) the number of the stores using ActiveRecord's count method,
to ensure that there are three stores in the database.
=end

burnaby = Store.create(
  name: "Burnaby",
  annual_revenue: 300_000,
  mens_apparel: true,
  womens_apparel: true
)

richmond = Store.create(
  name: "Richmond",
  annual_revenue: 1_260_000,
  mens_apparel: false,
  womens_apparel: true
)

gastown = Store.create(
  name: "Gastown",
  annual_revenue: 190_000,
  mens_apparel: true,
  womens_apparel: false
)  
        
puts "Count(stores): #{Store.all.count}"