class BankAccounts::CalculateTotalService
  def initialize(account, unity)
    @account = account
    @cash_account = CashAccount.current_opened_accounting(unity)
  end

  def calc!
    incomings = Incoming.open(@cash_account).where(bank_account_id: @account.id)
    outgoings = Outgoing.open(@cash_account).where(bank_account_id: @account.id)

    total_in = incomings.map{|inc| inc.value}.sum
    total_out = outgoings.map{|out| out.value}.sum

    return total_in - total_out
  end
end
