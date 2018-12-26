FactoryBot.define do
  factory :job_opportunity do
    company { Faker.name }
    title { Faker.name }
    description { Faker::Lorem.paragraph }
    level { Faker::Number.between(1, 10) }
  end
end
