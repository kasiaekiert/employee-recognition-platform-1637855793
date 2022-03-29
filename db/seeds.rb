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

1.upto(10) do |k|
  Kudo.where(title:"Kudo first#{k}").first_or_create! do |kudo|
    kudo.content = 'Content for this employee is excellent'
    kudo.giver = giver
    kudo.receiver = receiver
    kudo.company_value = company_value
  end
end

Kudo.where(title:"Kudo first").first_or_create! do |kudo|
  kudo.content = 'Content for this employee is excellent'
  kudo.giver_id = receiver.id
  kudo.receiver_id = giver.id
  kudo.company_value = company_value
end

1.upto(10) do |i|
  Reward.where(title: "title#{i}").first_or_create! do |reward|
    reward.description = 'Description of this reward'
    reward.price = 5
  end
end

11.upto(25) do |i|
  Reward.where(title: "title#{i}").first_or_create! do |reward|
    reward.description = 'Description of this reward'
    reward.price = 2
  end
end



