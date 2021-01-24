# == Schema Information
#
# Table name: company_unities
#
#  id                   :bigint           not null, primary key
#  name                 :string
#  company_id           :bigint
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class CompanyUnity < ApplicationRecord
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
  belongs_to :company
  has_many :users
  has_one :address

  ##
  # Validations
  validates_presence_of :name

  ##
  # Callbacks

  ##
  # Scopes

  ##
  # Class Methods

  ##
  # Instance Methods
end
