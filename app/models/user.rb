# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  name                   :string
#  social_security_number :string
#  business_substore_id   :bigint
#  role                   :integer
#  active                 :boolean          default(TRUE)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string
#  encrypted_password     :string           default("")
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#
class User < ApplicationRecord
  ##
  # Constants

  ##
  # Attributes

  ##
  # Enums
  enum role: { common: 0, adm: 1, manager: 2 }

  ##
  # Behaviours
  audited
  devise :database_authenticatable, :recoverable,
         :rememberable, :validatable, :lockable, :trackable

  ##
  # Relationships
  belongs_to :business_substore
  has_one :address

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
