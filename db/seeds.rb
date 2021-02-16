##
# Creating companies
p 'Creating companies'
4.times do
  Company.create(name: Faker::FunnyName.name, tax_id: Faker::CNPJ.numeric)
end

##
# Creating company unities for each company
p 'Creating unities for the companies'
Company.all.each do |company|
  rand(1..4).times do |i|
    company.company_unities.create(name: "Unity #{i}")
  end
end

##
# Creating bank accounts for the company unities
p 'Creating bank accounts'
CompanyUnity.all.each do |unity|
  unity.bank_accounts.create(
    name: 'Cash register',
    initial_value: 0,
    # institution_name: ''
  )
  unity.bank_accounts.create(
    name: 'Debit account',
    initial_value: 1500.00,
    # institution_name: ''
  )
  unity.bank_accounts.create(
    name: 'Credit account',
    initial_value: 0,
    # institution_name: ''
  )
end

##
# Creating users with all available roles in the system
p 'Creating users for the company unities'
CompanyUnity.all.each do |unity|
  ['common', 'adm', 'manager', 'finances_manager', 'attendant'].each do |role|
    unity.users.create(
      name: Faker::Name.name,
      email: "#{role}#{unity.id}@test.com",
      password: 'test123',
      password_confirmation: 'test123',
      social_security_number: Faker::CPF.numeric,
      role: role
    )
  end
end

##
# Creating Incomings
p 'Creating incomings'
CompanyUnity.all.each do |unity|
  rand(7..10).times do
    CashAccount.current_opened_accounting(unity).incomings.create(
      client_name: Faker::Name.name,
      client_identification: Faker::CPF.numeric,
      observations: Faker::Lorem.sentence(word_count: 6),
      description: Faker::Lorem.sentence(word_count: 3),
      paid: true,
      paid_at: Time.now,
      bank_account_id: unity.bank_accounts.find(unity.bank_accounts.pluck(:id).sample).id,
      value: rand(200..1500)
    )
  end
end

##
# Creating outgoings
p 'Creating outgoings'
CompanyUnity.all.each do |unity|
  rand(4..6).times do
    CashAccount.current_opened_accounting(unity).outgoings.create(
      client_name: Faker::Name.name,
      client_identification: Faker::CPF.numeric,
      observations: Faker::Lorem.sentence(word_count: 6),
      description: Faker::Lorem.sentence(word_count: 3),
      paid: true,
      expense: rand(0..1),
      paid_at: Time.now,
      bank_account_id: unity.bank_accounts.find(unity.bank_accounts.pluck(:id).sample).id,
      value: rand(100..900)
    )
  end
end
