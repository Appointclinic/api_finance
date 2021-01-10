# == Schema Information
#
# Table name: business
#
#  id                   :bigint           not null, primary key
#  name                 :string
#  tax_id               :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class Business < ApplicationRecord
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
  has_many :business_substores
  has_many :users, through: :business_substores
  has_many :addresses, through: :business_substores

  ##
  # Validations
  validates_presence_of :name, :tax_id

  ##
  # Callbacks

  ##
  # Scopes

  ##
  # Class Methods

  ##
  # Instance Methods
end
