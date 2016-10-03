shops = [
  { shop_name: 'Blessings', location: 'Shopping Center', email: 'blessings@gmail.com', password: 'password', contact_number: '09061234567', price_blwt: 100, price_grey: 200, price_colr: 300},
  { shop_name: 'DHolyBook', location: 'Shopping Center', email: 'holybook@gmail.com', password: 'password', contact_number: '09071234567', price_blwt: 200, price_grey: 400, price_colr: 600},
  { shop_name: 'Rocids', location: 'Area 2', email: 'example@yahoo.com', password: 'password', contact_number: '09069696969', price_blwt: 300, price_grey: 600, price_colr: 900},
  { shop_name: 'EatAllYouCan', location: 'Area 2', email: 'waitmayexampapala@yahoo.com', password: 'password', contact_number: '09069696969', price_blwt: 300, price_grey: 600, price_colr: 900}
]


students = [
  { name: 'Juan Dela Cruz', student_number: '201500000', email: 'jdc@gmail.com', password: 'password', contact_number: '09161234567'},
  { name: 'Francis Delacruz', student_number: '201508080', email: 'fzqdlc69@gmail.com', password: 'password', contact_number: '09169696969'},
  { name: 'Huwan Ofthe Cross', student_number: '201500000', email: 'example@gmail.com', password: 'password', contact_number: '09167654321'},
  { name: 'Huwan Walang Cross', student_number: '201510000', email: 'wew@gmail.com', password: 'password', contact_number: '09167654322'},
  { name: 'Huwan Naputol ang Cross', student_number: '201520000', email: 'wow@gmail.com', password: 'password', contact_number: '09167654323'}
]

transactions = [
  { student_id: 1, shop_id: 1, paper_size: "A4", color_settings: "Colored", number_pages: 2, date_sent: Time.now, price: 7.00},
  { student_id: 2, shop_id: 1, paper_size: "A4", color_settings: "Colored", number_pages: 3, date_sent: Time.now, date_downloaded: Time.now + 100000, price: 10.00},
  { student_id: 3, shop_id: 1, paper_size: "A4", color_settings: "Colored", number_pages: 6, date_sent: Time.now, date_downloaded: Time.now + 100000, price: 2.00},
  { student_id: 3, shop_id: 1, paper_size: "A4", color_settings: "Colored", number_pages: 1, date_sent: Time.now, date_downloaded: Time.now + 100000, date_paid: Time.now + 300000, price: 9.00},
  { student_id: 2, shop_id: 2, paper_size: "A4", color_settings: "Colored", number_pages: 4, date_sent: Time.now, price: 20.00},
  { student_id: 3, shop_id: 2, paper_size: "A4", color_settings: "Colored", number_pages: 8, date_sent: Time.now, date_downloaded: Time.now + 100000, price: 30.00},
  { student_id: 1, shop_id: 2, paper_size: "A4", color_settings: "Colored", number_pages: 2, date_sent: Time.now, date_downloaded: Time.now + 100000, date_paid: Time.now + 300000, price: 10.00},
  { student_id: 3, shop_id: 3, paper_size: "A4", color_settings: "Colored", number_pages: 2, date_sent: Time.now, price: 40.00},
  { student_id: 1, shop_id: 3, paper_size: "A4", color_settings: "Colored", number_pages: 3, date_sent: Time.now, date_downloaded: Time.now + 100000, price: 25.00},
  { student_id: 2, shop_id: 3, paper_size: "A4", color_settings: "Colored", number_pages: 9, date_sent: Time.now, date_downloaded: Time.now + 100000, date_paid: Time.now + 300000, price: 51.00},
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

transactions.each do |transaction|
  t = Transaction.create(transaction)
  t.save
end
