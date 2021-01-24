require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'On create' do
    subject { build(:company) }

    it { should validate_presence_of :name }
    it { should validate_presence_of :tax_id }

    it { expect(subject.tax_id).to be_kind_of(String) }
    it { expect(subject.tax_id.length).to be(14) }
    it { expect(subject.tax_id.scan(/\D/).empty?).to be true }
  end
end
