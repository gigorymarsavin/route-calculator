User.create!(email: 'sasha@example.com', password: '123456', password_confirmation: '123456')
Api.create!(name: 'Distanceorg', status: true)

rng = 1..30
rng.each do
  Package.create!(email: Faker::Internet.email, weight: 12, length: 20, width: 30, height: 40, addr_from: Faker::Address.city , addr_to: Faker::Address.city , name: Faker::Name.first_name, surname: Faker::Name.last_name , midname: Faker::Name.last_name , phone: '77777777', price: rand(10..1000), size: rand(5..100), distance: rand(100..1000), user_id: 1)
end

puts 'SEEDS DONE'