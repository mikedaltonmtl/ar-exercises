class Employee < ActiveRecord::Base
  belongs_to :store

  validates :store, :first_name, :last_name, presence: true
  validates :hourly_rate, numericality: { only_integer: true, in: 40..200 }

  before_save :add_random_password

  private

  def generate_code(number)
    charset = Array('A'..'Z') + Array('a'..'z')
    Array.new(number) { charset.sample }.join
  end

  def add_random_password
    self.password = generate_code(8)
  end

end

=begin
  create_table :employees do |table|
    table.references :store
    table.column :first_name, :string
    table.column :last_name, :string
    table.column :hourly_rate, :integer
    table.timestamps null: false
  end

Employees must always have a first name present
Employees must always have a last name present
Employees have a hourly_rate that is a number (integer) between 40 and 200
Employees must always have a store that they belong to (can't have an employee that is not assigned a store)
=end