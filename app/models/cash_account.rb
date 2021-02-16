# == Schema Information
#
# Table name: cash_accounts
#
#  id                   :bigint           not null, primary key
#  company_unity_id     :bigint
#  enclosing            :date
#  closed               :boolean          default(false)
#  responsible          :string
#  total_registered     :decimal
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class CashAccount < ApplicationRecord
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
  belongs_to :company_unity
  has_many :incomings
  has_many :outgoings

  ##
  # Validations

  ##
  # Callbacks

  ##
  # Scopes
  scope :closed, -> { where(closed: true) }
  scope :open, -> { where(closed: false) }

  ##
  # Class Methods
  class << self
    def current_opened_accounting(company_unity)
      where(company_unity_id: company_unity.id).open.last
    end
  end

  ##
  # Instance Methods
  def check_enclosure
    accountings = CashAccount.closed.select do |ca|
      ca.enclosing.day == self.enclosing.day
      ca.enclosing.month == self.enclosing.month
      ca.enclosing.year == self.enclosing.year
    end

    self.enclosing = self.enclosing + 1.day if accountings.any?
  end

  def set_total
    total_incomings = self.incomings.paid.map{|inc|inc.value}.sum
    total_outgoings = self.outgoings.paid.map{|out|out.value}.sum

    self.update(total_registered: total_incomings - total_outgoings)
  end  
end
