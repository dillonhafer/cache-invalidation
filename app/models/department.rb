class Department < ActiveRecord::Base
  has_many :expenses
  has_many :members
  has_many :tax_records
end
