class CashAccount < ApplicationRecord
  belongs_to :company_unity
  before_save :check_enclosure, only: :update

  def check_enclosure
    accountings = CashAccount.select do |ca|
      ca.enclosing.day == self.enclosing.day
      ca.enclosing.month == self.enclosing.month
      ca.enclosing.year == self.enclosing.year
    end

    self.enclosing = self.enclosing + 1.day if accountings.any?
  end
end
