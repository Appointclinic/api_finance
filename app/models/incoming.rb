# == Schema Information
#
# Table name: Incomings
#
#  id                       :bigint           not null, primary key
#  cash_account_id          :bigint
#  parent_id                :bigint
#  client_name              :string
#  client_identification    :string
#  value                    :decimal
#  observations             :text
#  description              :string
#  bank_account_id          :bigint
#  kind                     :integer
#  split                    :boolean          default: false
#  repeat                   :boolean          default: false
#  repeat_period            :integer
#  repeat_occurrency        :integer
#  upfront_payment          :decimal
#  split_quantity           :integer
#  due_date                 :date
#  paid                     :boolean          default: false
#  paid_at                  :date
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#
class Incoming < ApplicationRecord
  ##
  # Constants

  ##
  # Attributes

  ##
  # Enums
  enum repeat_period: { daily: 0, weekly: 1, biweekly: 2, monthly: 3, yearly: 4 }
  enum kind: { money: 0, credit_card: 1, debit_card: 2, cheque: 3, billet: 4, bank_transfer: 5 }

  ##
  # Behaviours
  audited

  ##
  # Relationships
  belongs_to :cash_account
  belongs_to :splitted, class_name: 'Incoming', foreign_key: :parent_id, optional: true

  ##
  # Validations

  ##
  # Callbacks
  before_create :set_empty_values
  after_create :split_incoming, if: :is_splited?
  after_create :repeat_incoming, if: :is_repeated?
  after_create :check_paid

  ##
  # Scopes
  scope :paid, -> { where(paid: true) }
  scope :open, -> (cash_account) { where(cash_account: cash_account) }

  ##
  # Class Methods

  ##
  # Instance Methods
  def split_incoming
    Incomings::SplitIncomingService.new(self).split!
  end

  def repeat_incoming
    Incomings::RepeatIncomingService.new(self).repeat!
  end

  def set_empty_values
    self.description = "" if self.description.nil?
    self.due_date = Date.today if self.due_date.nil?
  end  

  def is_splited?
    return self.split
  end

  def is_repeated?
    return self.repeat
  end

  def check_paid
    self.update(paid: true) if self.paid_at.present?
  end
end
