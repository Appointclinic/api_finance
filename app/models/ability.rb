class Ability
  include CanCan::Ability

  FINANCES = [BankAccount, CashAccount]
  TRANSACTIONS = [Incoming, Outgoing]
  COMPANY_INFO = [Address, Company]

  def initialize(user)
    user_comp_unities = user.company_unities.map{|un|un.id}
    user_cash_accounts = CashAccount.all_opened_accounts(user_comp_unities)

    if user.present?
      can :read, COMPANY_INFO, company_unity_id: user_comp_unities
      can :read, CompanyUnity, id: user_comp_unities
      if user.admin?
        can :manage, :all
      else
        if user.manager?
          can :manage, FINANCES, company_unity_id: user_comp_unities
          can :manage, TRANSACTIONS, cash_account_id: user_cash_accounts
        elsif user.finances_manager?
          can :manage, FINANCES, company_unity_id: user_comp_unities
        elsif user.attendant?
          can :manage, TRANSACTIONS, company_unity_id: user_comp_unities
        end
      end
    end
  end
end
