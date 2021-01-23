# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  name                   :string
#  social_security_number :string
#  company_unity_id       :bigint
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
#  provider               :string           default("email"), not null
#  uid                    :string           default(""), not null
#  allow_password_change  :boolean          default(false)
#  tokens                 :json
#
class User < ApplicationRecord
  ##
  # Constants

  ##
  # Attributes

  ##
  # Enums
  enum role: { common: 0, adm: 1, manager: 2, finances_manager: 3, attendant: 4 }

  ##
  # Behaviours
  audited
  devise :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable, :lockable
  include DeviseTokenAuth::Concerns::User

  ##
  # Relationships
  belongs_to :company_unity
  has_one :address

  ##
  # Validations
  validates_presence_of :name, length: { minimum: 3, maximum: 30 }
  validates_presence_of :social_security_number, length: { is: 11 }, numericality: { only_integer: true }
  validates_presence_of :role, in: 0..4

  ##
  # Callbacks

  ##
  # Scopes

  ##
  # Class Methods

  ##
  # Instance Methods
end
