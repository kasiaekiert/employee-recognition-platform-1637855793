# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

1.upto(5) do |i|
  Employee.where(email: "employee#{i}@example.com").first_or_create! do |employee|
    employee.password = 'password'
  end
end

Admin.where(email:"admin@example.com").first_or_create! do |admin|
  admin.password = 'password'
end

CompanyValue.where(title:"Patient").first_or_create!
CompanyValue.where(title:"Helpful").first_or_create!
