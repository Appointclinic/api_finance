# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

companies = Company.create([
  { name: 'Demo Clinic', tax_id: '123456' },
  { name: 'Another Clinic', tax_id: '6543' }
])

User.create(
  name: 'Demo',
  email: 'demo@gmail.com',
  password: 'demo123',
  password_confirmation: 'demo123',
  social_security_number: '11111',
  role: 'attendant'
)

CompanyUnity.create([
  {
    name: 'Unity 1',
    company_id: Company.first.id,
    users: [User.first]
  },
  {
    name: 'Unity 2',
    company_id: Company.first.id,
    users: [User.first]
  }
])