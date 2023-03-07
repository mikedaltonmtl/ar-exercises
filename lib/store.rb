class Store < ActiveRecord::Base
  has_many :employees, :dependent => :restrict_with_error

  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: { only_integer: true }
  validates :annual_revenue, numericality: { greater_than_or_equal_to: 0 }

  validate :apparel_presence

  private

  def carries_apparel?
    mens_apparel == true || womens_apparel == true
  end

  def apparel_presence
    unless carries_apparel?
      errors.add(:mens_apparel, message: "- the store must carry either mens or womens apparel.")
      errors.add(:womens_apparel, message: "- the store must carry either mens or womens apparel.")
    end
  end
end

=begin
  create_table :stores do |t|
    t.column :name, :string
    t.column :annual_revenue, :integer
    t.column :mens_apparel, :boolean
    t.column :womens_apparel, :boolean
    t.timestamps null: false
  end

  Stores must always have a name that is a minimum of 3 characters
  Stores have an annual_revenue that is a number (integer) that must be 0 or more
  BONUS: Stores must carry at least one of the men's or women's apparel
  (hint: use a custom validation method - don't use a Validator class)

  For data integrity reasons, we want to restrict users from deleting (aka destroying)
  store records for stores that have 1 or more employees.
=end
