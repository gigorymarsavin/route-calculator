FactoryBot.define do
  factory :user do
    email {Faker::Internet.unique.email}
    password {"123456"}
    password_confirmation {'123456'}
    id {1}
    is_admin {false}
    organisation_id {1}
  end

  factory :package do
    email {Faker::Internet.unique.email}
    name {Faker::Name.unique.name}
    surname {Faker::Name.unique.last_name}
    midname {Faker::Name.unique.last_name}
    phone {'8382832883283'}
    user_id {1}
    width {23}
    length {21}
    height {11}
    weight {33}
    price {rand(100)}
    distance {rand(1000)}
    addr_from {'Moscow'}
    addr_to {'London'}
    organisation_id {1}
  end

  factory :api do
    name {'Distanceorg'}
    status {true}
  end
end