class CashAccount < ApplicationRecord
  belongs_to :company_unity

  scope :closed, -> { where(closed: true) }

  has_many :incomings
  has_many :outgoings

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
