class Incoming < ApplicationRecord
  belongs_to :cash_account

  belongs_to :splitted, class_name: 'Incoming', foreign_key: :parent_id, optional: true

  enum repeat_period: { daily: 0, weekly: 1, biweekly: 2, monthly: 3, yearly: 4 }
  enum kind: { money: 0, credit_card: 1, debit_card: 2, cheque: 3, billet: 4, bank_transfer: 5 }

  after_create :split_incoming, if: :is_splited?
  after_create :repeat_incoming, if: :is_repeated?
  after_create :check_paid

  def split_incoming
    self.value = self.upfront_payment
    split_values = (self.value - self.upfront_payment) / self.split_quantity

    self.split_quantity.times do |i|
      Incoming.create(
        cash_account_id:        self.cash_account_id,
        parent_id:              self.id,
        client_name:            self.client_name,
        client_identification:  self.client_identification,
        value:                  split_values,
        observations:           self.observations,
        description:            'Parcela ' + i + ' do pagamento: ' + self.description,
        bank_account_id:        self.bank_account_id,
        kind:                   self.kind,
        split:                  false,
        repeat:                 false,
        due_date:               self.due_date + 1.month,
        paid:                   false
      )
    end

    self.save
  end

  def repeat_incoming
    self.repeat_occurrency.times do |i|
      due_date = self.set_due_date(self.due_date, i)

      Incoming.create(
        cash_account_id:        self.cash_account_id,
        parent_id:              self.id,
        client_name:            self.client_name,
        client_identification:  self.client_identification,
        value:                  self.value,
        observations:           self.observations,
        description:            'Pagamento ' + i + ' de ' + self.repeat_occurrency + ' de: ' + self.description,
        bank_account_id:        self.bank_account_id,
        kind:                   self.kind,
        split:                  false,
        repeat:                 false,
        due_date:               due_date,
        paid:                   false
      )
    end
  end

  def set_due_date(due_date, i)
    case due_date
    when 'daily'
      return due_date + i.day
    when 'weekly'
      return due_date + i.week
    when 'biweekly'
      return due_date + (i + 1).week
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
end
