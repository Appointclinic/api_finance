require 'rails_helper'

RSpec.describe "CashAccounts", type: :request do
  describe "On enclosing" do
    before do
      @company = create(:company)
      @company_unity = create(:company_unity, company: @company)

      @cash_accounting = create(:cash_account, company_unity: @company_unity)
      post "/api/v1/make_account", params: { id: @cash_accounting.id, responsible: 'rannyeri' }

      @cash_accounting.reload
    end

    it 'must create a new CashAccount for the next day' do
      expect(CashAccount.all.count).to eq(2)
    end

    it 'must have a responsible' do
      expect(@cash_accounting.responsible).to eq('rannyeri')
    end

    it 'can not have the same date of another CashAccount' do
      expect(@cash_accounting.enclosing).to eq(Date.today + 1.day)
    end

    it 'must have a total' do
      create(:incoming, :paid_incoming, value: 200.00, cash_account: @cash_accounting)
      create(:outgoing, :paid, value: 100.00, cash_account: @cash_accounting)

      post "/api/v1/make_account", params: { id: @cash_accounting.id, responsible: 'rannyeri' }
      @cash_accounting.reload
      expect(@cash_accounting.total_registered).to eq(100.00)
    end
  end
end
