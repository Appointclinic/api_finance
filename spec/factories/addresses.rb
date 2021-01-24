FactoryBot.define do
  factory :address do
    street { "MyString" }
    neighborhood { "MyString" }
    city { "MyString" }
    state { "MyString" }
    country { "MyString" }
    number { "MyString" }
    complement { "MyString" }
    postal_code { "MyString" }
    relative_id { "" }
  end
end
