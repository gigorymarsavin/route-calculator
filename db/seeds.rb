User.create!(email: 'admin@example.com', password: '123456', password_confirmation: '123456', organisation_id: 1,  is_admin: true)
x_operator = User.create!(email: 'x_operator@example.com', password: '123456', password_confirmation: '123456', organisation_id: 1, is_admin: false)
y_operator = User.create!(email: 'y_operator@example.com', password: '123456', password_confirmation: '123456', organisation_id: 1, is_admin: false)

Api.create!(name: 'Distanceorg', status: true)

rng = 1..10
rng.each do
  Package.create!(email: Faker::Internet.email, weight: 12, length: 20, width: 30, height: 40, addr_from: Faker::Address.city , addr_to: Faker::Address.city , name: Faker::Name.first_name, surname: Faker::Name.last_name , midname: Faker::Name.last_name , phone: '77777777', price: rand(10..1000), size: rand(5..100), distance: rand(100..1000), user_id: x_operator.id, organisation_id: 1)
end

rng.each do
  Package.create!(email: Faker::Internet.email, weight: 12, length: 20, width: 30, height: 40, addr_from: Faker::Address.city , addr_to: Faker::Address.city , name: Faker::Name.first_name, surname: Faker::Name.last_name , midname: Faker::Name.last_name , phone: '77777777', price: rand(10..1000), size: rand(5..100), distance: rand(100..1000), user_id: y_operator.id, organisation_id: 1)
end

puts 'SEEDS DONE'