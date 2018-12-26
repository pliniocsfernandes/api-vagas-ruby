FactoryBot.define do
  factory :path do
    distance { Faker::Number.between(1, 10) }
  end
end
