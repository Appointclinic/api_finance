# == Schema Information
#
# Table name: addresses
#
#  id                   :bigint           not null, primary key
#  street               :string
#  neighborhood         :string
#  city                 :string
#  state                :string
#  country              :string           default('BR')
#  number               :string
#  complement           :string
#  postal_code          :string
#  company_id           :bigint
#  user_id              :bigint
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class Address < ApplicationRecord
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
  belongs_to :company, class_name: 'BusinessSubstore', foreign_key: :company_id, optional: true
  belongs_to :user, optional: true

  ##
  # Validations

  ##
  # Callbacks

  ##
  # Scopes

  ##
  # Class Methods

  ##
  # Instance Methods
end
