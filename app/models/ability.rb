class Ability
  include CanCan::Ability

  FINANCES = [BankAccount, CashAccount, Incoming, Outgoing]
  TRANSACTIONS = [Incoming, Outgoing]
  COMPANY_INFO = [CompanyUnity, Address, Company]

  def initialize(user)
    user_comp_unities = user.company_unities.map{|un|un.id}

    if user.admin?
      can :manage, :all
    elsif user.manager?
      can :manage, FINANCES, company_unity_id: user_comp_unities
      can :read,   COMPANY_INFO, company_unity_id: user_comp_unities
    elsif user.finances_manager?
      can :manage, FINANCES, company_unity_id: user_comp_unities
    elsif user.attendant?
      can :manage, TRANSACTIONS, company_unity_id: user_comp_unities
    end
  end
end
