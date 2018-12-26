FactoryBot.define do
  factory :person do
    name { Faker.name }
    profession { Faker.name }
    level { Faker::Number.between(1, 10) }
  end
end
