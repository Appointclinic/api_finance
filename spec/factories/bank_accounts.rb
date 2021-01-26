FactoryBot.define do
  factory :bank_account do
    name { Faker::Name.name }
    initial_value { "9.99" }
  end
end
