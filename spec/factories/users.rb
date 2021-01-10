FactoryBot.define do
  factory :user do
    name { "MyString" }
    social_security_number { "MyString" }
    business_substore { nil }
    role { 1 }
  end
end
