# == Schema Information
#
# Table name: business_substores
#
#  id                   :bigint           not null, primary key
#  name                 :string
#  business_id          :bigint
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class BusinessSubstore < ApplicationRecord
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
  belongs_to :business
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
