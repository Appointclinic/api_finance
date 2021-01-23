FactoryBot.define do
  factory :jwt_blacklist do
    jti { "MyString" }
    exp { "2021-01-22 12:26:12" }
  end
end
