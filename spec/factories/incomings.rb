FactoryBot.define do
  factory :incoming do
    cash_account { nil }
    parent_id { "" }
    client_name { "MyString" }
    client_identification { "MyString" }
    value { "9.99" }
    observations { "MyText" }
    description { "MyString" }
    bank_account_id { nil }
    kind { "MyString" }
    split { false }
    repeat { false }
    repeat_period { "MyString" }
    repeat_occurrency { "MyString" }
    upfront_payment { "9.99" }
    split_quantity { 1 }
    due_date { "2021-01-26" }
    paid { false }
    paid_at { "2021-01-26" }
  end
end
