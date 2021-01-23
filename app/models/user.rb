# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  name                   :string
#  social_security_number :string
#  company_unities_id     :bigint
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
  # has_secure_password

  devise :database_authenticatable, :recoverable,
         :rememberable, :validatable, :lockable, :trackable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  ##
  # Relationships
  belongs_to :company_unities
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
  def generate_jwt
    JWT.encode({
      user: [
        id: self.id,
        name: self.name,
        email: self.email,
        role: self.role,
        active: self.active
      ],
      exp: 10.days.from_now.to_i
    },
    Rails.application.credentials.dig(:secret_key_base))
  end
end
