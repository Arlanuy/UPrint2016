shops = [
  { shop_name: 'Blessings', location: 'Shopping Center', email: 'blessings@gmail.com', password: 'password', contact_number: '09061234567'},
  { shop_name: 'DHolyBook', location: 'Shopping Center', email: 'holybook@gmail.com', password: 'password', contact_number: '09071234567' }
]

students = [
  { name: 'Juan Dela Cruz', student_number: '201500000', email: 'jdc@gmail.com', password: 'password', contact_number: '09161234567'}
]

shops.each do |shop|
  if Shop.find_by_email(shop[:email]).nil?
    s = Shop.create(shop)
    s.save
    s.confirm
  end
end

students.each do |student|
  if Student.find_by_email(student[:email]).nil?
    s = Student.create(student)
    s.save
    s.confirm
  end
end
