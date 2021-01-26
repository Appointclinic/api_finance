require 'rails_helper'

RSpec.describe Incoming, type: :model do
  describe "When split" do
    before do
      company = create(:company)
      company_unity = create(:company_unity, company: company)
      @cash_accounting = create(:cash_account, company_unity: company_unity)
      @incoming = create(:incoming, :paid_incoming, :split_incoming, split_quantity: 4, value: 1500.00, cash_account: @cash_accounting)
    end

    it "should create incomings associated with it self" do
      splitted = Incoming.where.not(id: @incoming.id).map{|inc|inc.splitted}.uniq
      expect(splitted).to eq([@incoming])
    end

    it "shold have the correct amount of splits" do
      splits = Incoming.select{|inc| inc.splitted == @incoming}.count
      expect(splits).to eq(3)
    end

    it "should have the same due date but one month ahead" do
      splitted = Incoming.where.not(id: @incoming.id).map{|inc|inc.due_date}
      expect(splitted).to eq([@incoming.due_date + 1.month, @incoming.due_date + 2.month, @incoming.due_date + 3.month])
    end

    it "must have only the first one paid" do
      splits = Incoming.select{|inc| inc.check_paid }
      expect(splits).to eq([@incoming])
    end

    context "with upfront_payment" do
      before do
        Incoming.all.each { |inc| inc.destroy }
        @incoming = create(:incoming, :split_incoming, split_quantity: 4, value: 1600.00, cash_account: @cash_accounting, upfront_payment: 400.00)
      end

      it "should have a smaller value for the splits if it has upfront_payment" do
        value = Incoming.where.not(id: @incoming.id).map{|inc|inc.value}.uniq
        expect(value).to eq([400.00])
      end

      it "should totalize the correct amount when summed" do
        total = Incoming.all.map{|inc|inc.value}.sum
        expect(total).to eq(1600)
      end
    end

    context "without upfront_payment" do
      before do
        Incoming.all.each { |inc| inc.destroy }
        @incoming = create(:incoming, :split_incoming, split_quantity: 4, value: 1500.00, cash_account: @cash_accounting)
      end

      it "should split the value evenly" do
        value = Incoming.all.map{|inc|inc.value}.uniq
        expect(value).to eq([375.00])
      end

      it "should totalize the correct amount when summed" do
        total = Incoming.all.map{|inc|inc.value}.sum
        expect(total).to eq(1500)
      end
    end
  end

  describe "When repeat" do
    before do
      company = create(:company)
      company_unity = create(:company_unity, company: company)
      @cash_accounting = create(:cash_account, company_unity: company_unity)
      @incoming = create(:incoming, :paid_incoming, :rep_incoming, repeat_occurrency: 4, repeat_period: 'biweekly', value: 250.00, cash_account: @cash_accounting)
    end

    it "must create the right amount of incomings" do
      repeats = Incoming.all.count
      expect(repeats).to eq(4)
    end

    it "must all have the same value" do
      value = Incoming.where.not(id: @incoming.id).map{|inc|inc.value}.uniq
      expect(value).to eq([250.00])
    end

    it "must validate the due date depending on the period" do
      repeated = Incoming.all.map{|inc|inc.due_date}
      expect(repeated).to eq([@incoming.due_date, @incoming.due_date + 15.days, @incoming.due_date + 30.days, @incoming.due_date + 45.days])
    end

    it "must validate that the created incomings are associated with the first one" do
      repeated = Incoming.where.not(id: @incoming.id).map{|inc|inc.splitted}.uniq
      expect(repeated).to eq([@incoming])
    end
  end
end
