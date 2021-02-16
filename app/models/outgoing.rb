# == Schema Information
#
# Table name: Outgoings
#
#  id                       :bigint           not null, primary key
#  client_name              :string
#  cash_account_id          :bigint           not null
#  parent_id                :bigint
#  client_identification    :string
#  value                    :decimal
#  expense                  :boolean          default: false
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
class Outgoing < ApplicationRecord
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
  belongs_to :splitted, class_name: 'Outgoing', foreign_key: :parent_id, optional: true

  ##
  # Validations

  ##
  # Callbacks
  before_create :set_empty_values
  after_create :split_outgoing, if: :is_splited?
  after_create :repeat_outgoing, if: :is_repeated?
  after_create :check_paid

  ##
  # Scopes
  scope :paid, -> { where(paid: true) }
  scope :open, -> (cash_account) { where(cash_account: cash_account) }

  ##
  # Class Methods

  ##
  # Instance Methods
  def split_outgoing
    Outgoings::SplitOutgoingService.new(self).split!
  end

  def repeat_outgoing
    Outgoings::RepeatOutgoingService.new(self).repeat!
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

  def is_expense?
    return self.expense
  end

  def check_paid
    self.update(paid: true) if self.paid_at.present?
  end
end
