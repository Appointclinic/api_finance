# == Schema Information
#
# Table name: companies
#
#  id                   :bigint           not null, primary key
#  name                 :string
#  tax_id               :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class Company < ApplicationRecord
  ##
  # Constants

  ##
  # Attributes

  ##
  # Enums

  ##
  # Behaviours
  audited

  ##
  # Relationships
  has_many :company_unities
  has_many :users, through: :company_unities
  has_many :addresses, through: :company_unities
  has_many :cash_accounts, through: :company_unities
  has_many :bank_accounts, through: :company_unities
  has_many :incomigns, through: :company_unities
  has_many :outgoings, through: :company_unities

  ##
  # Validations
  validates_presence_of :name
  validates_presence_of :tax_id, length: { is: 14 }, numericality: { only_integer: true }

  ##
  # Callbacks

  ##
  # Scopes

  ##
  # Class Methods
  class <<  self
    def current_user_company(user)
      select { |company| company.id.in? user.company_unities.pluck(:company_id) }
    end
  end

  ##
  # Instance Methods
end
