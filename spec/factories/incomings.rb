FactoryBot.define do
  factory :incoming do
    client_name { Faker::Name.name }
    client_identification { Faker::CPF.numeric }
    observations { Faker::Lorem.sentence(word_count: 6) }
    description { Faker::Lorem.sentence(word_count: 3) }

    trait :rep_incoming do
      repeat { true }
    end

    trait :split_incoming do
      split { true }
    end

    trait :paid_incoming do
      paid { true }
      paid_at { Date.today }
    end
  end

  factory :rep_incoming, traits: [:rep_incoming]
  factory :split_incoming, traits: [:split_incoming]
  factory :paid_incoming, traits: [:paid_incoming]
end
