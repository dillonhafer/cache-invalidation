class Location < ActiveRecord::Base
  has_many :expenses
end
