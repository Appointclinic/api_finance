FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    social_security_number { Faker::CPF.numeric }
    email { Faker::Name.name.gsub!(/[^0-9A-Za-z]/, '') + "@gmail.com" }

    trait :with_password do
      password { '123456' }
      password_confirmation { '123456' }
    end

    trait :common do
      role { 0 }
    end
    trait :adm do
      role { 1 }
    end
    trait :manager do
      role { 2 }
    end
    trait :finances_manager do
      role { 3 }
    end
    trait :attendant do
      role { 4 }
    end
  end

  factory :common, traits: [:common]
  factory :adm, traits: [:adm]
  factory :manager, traits: [:manager]
  factory :finances_manager, traits: [:finances_manager]
  factory :attendant, traits: [:attendant]
  factory :with_password, traits: [:with_password]
end
