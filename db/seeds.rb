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

receiver = Employee.find_by(email: 'employee1@example.com')
giver = Employee.find_by(email: 'employee3@example.com')

Admin.where(email:"admin@example.com").first_or_create! do |admin|
  admin.password = 'password'
end

company_value = CompanyValue.where(title:"Patient").first_or_create!
CompanyValue.where(title:"Helpful").first_or_create!

Kudo.where(title:"Kudo first").first_or_create! do |kudo|
  kudo.content = 'Content for this employee is excellent'
  kudo.giver_id = receiver.id
  kudo.receiver_id = giver.id
  kudo.company_value = company_value
end
