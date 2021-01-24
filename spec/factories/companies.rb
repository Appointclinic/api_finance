FactoryBot.define do
  factory :company do
    name { Faker::Name.name }
    tax_id { Faker::CNPJ.numeric }
  end
end
