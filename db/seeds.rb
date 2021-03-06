# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


a  = Department.create(name: 'Academics')
hr = Department.create(name: 'Human Resources')
t  = Department.create(name: 'Transportation')
l  = Location.create(name: 'First Location')

# Academics
a.tax_records.create(name: 'A Deduction')
a.tax_records.create(name: 'A Payroll')
a.tax_records.create(name: 'A Enrollment')
a.expenses.create(name: 'A Utilities', location: l)
a.expenses.create(name: 'A Vehicles', location: l)
a.expenses.create(name: 'A Payroll', location: l)
a.members.create(name: 'A Bob')
a.members.create(name: 'A Joe')
a.members.create(name: 'A Sue')

# HR
hr.tax_records.create(name: 'HR Deduction')
hr.tax_records.create(name: 'HR Payroll')
hr.tax_records.create(name: 'HR Enrollment')
hr.expenses.create(name: 'HR Utilities', location: l)
hr.expenses.create(name: 'HR Vehicles', location: l)
hr.expenses.create(name: 'HR Payroll', location: l)
hr.members.create(name: 'HR Bob')
hr.members.create(name: 'HR Joe')
hr.members.create(name: 'HR Sue')

# Transportation
t.tax_records.create(name: 'T Deduction')
t.tax_records.create(name: 'T Payroll')
t.tax_records.create(name: 'T Enrollment')
t.expenses.create(name: 'T Utilities', location: l)
t.expenses.create(name: 'T Vehicles', location: l)
t.expenses.create(name: 'T Payroll', location: l)
t.members.create(name: 'T Bob')
t.members.create(name: 'T Joe')
t.members.create(name: 'T Sue')
