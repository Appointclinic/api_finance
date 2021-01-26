FactoryBot.define do
  factory :outgoing do
    client_name { Faker::Name.name }
    client_identification { Faker::CPF.numeric }
    observations { Faker::Lorem.sentence(word_count: 6) }
    description { Faker::Lorem.sentence(word_count: 3) }

    trait :repeated do
      repeat { true }
    end

    trait :splited do
      split { true }
    end

    trait :paid do
      paid { true }
      paid_at { Date.today }
    end
  end

  factory :repeated,  traits: [:repeated]
  factory :splited,  traits: [:splited]
  factory :paid,  traits: [:paid]
end
