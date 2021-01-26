class Incoming < ApplicationRecord
  belongs_to :cash_account

  belongs_to :splitted, class_name: 'Incoming', foreign_key: :parent_id, optional: true

  enum repeat_period: { daily: 0, weekly: 1, biweekly: 2, monthly: 3, yearly: 4 }
  enum kind: { money: 0, credit_card: 1, debit_card: 2, cheque: 3, billet: 4, bank_transfer: 5 }

  scope :paid, -> { where(paid: true) }

  before_create :set_empty_values
  after_create :split_incoming, if: :is_splited?
  after_create :repeat_incoming, if: :is_repeated?
  after_create :check_paid

  def split_incoming
    if self.upfront_payment.present?
      split_values = (self.value - self.upfront_payment) / (self.split_quantity - 1)
      self.value = self.upfront_payment
    else
      split_values = self.value / self.split_quantity
      self.value = split_values
    end

    splits = self.split_quantity - 1

    splits.times do |i|
      i += 1
      Incoming.create(
        cash_account_id:        self.cash_account_id,
        parent_id:              self.id,
        client_name:            self.client_name,
        client_identification:  self.client_identification,
        value:                  split_values,
        observations:           self.observations,
        description:            'Parcela ' + i.to_s + ' do pagamento: ' + self.description,
        bank_account_id:        self.bank_account_id,
        kind:                   self.kind,
        split:                  false,
        repeat:                 false,
        due_date:               self.due_date + i.month,
        paid:                   false
      )
    end

    self.save
  end

  def repeat_incoming
    reps = self.repeat_occurrency - 1
    reps.times do |i|
      i += 1
      due_date = self.set_due_date(self.repeat_period, self.due_date, i)

      Incoming.create(
        cash_account_id:        self.cash_account_id,
        parent_id:              self.id,
        client_name:            self.client_name,
        client_identification:  self.client_identification,
        value:                  self.value,
        observations:           self.observations,
        description:            'Pagamento ' + i.to_s + ' de ' + self.repeat_occurrency.to_s + ' de: ' + self.description,
        bank_account_id:        self.bank_account_id,
        kind:                   self.kind,
        split:                  false,
        repeat:                 false,
        due_date:               due_date,
        paid:                   false
      )
    end
  end

  def set_empty_values
    self.description = "" if self.description.nil?
    self.due_date = Date.today if self.due_date.nil?
  end

  def set_due_date(period, due_date, i)
    case period
    when 'daily'
      return due_date + i.day
    when 'weekly'
      return due_date + i.week
    when 'biweekly'
      return due_date + (i * 15).days
    when 'monthly'
      return due_date + i.month
    when 'yearly'
      return due_date + i.year
    else
      return due_date
    end
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
