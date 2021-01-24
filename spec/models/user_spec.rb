require 'rails_helper'

RSpec.describe User, type: :model do
  describe "On create" do
    subject { build(:user, :with_password, :common) }

    it { should validate_presence_of :name }
    it { should validate_presence_of :social_security_number }
    it { should validate_presence_of :role }
    it { should define_enum_for(:role).with_values(common: 0, adm: 1, manager: 2, finances_manager: 3, attendant: 4) }

    it { expect(subject.social_security_number).to be_kind_of(String) }
    it { expect(subject.social_security_number.length).to be(11) }
    it { expect(subject.social_security_number.scan(/\D/).empty?).to be true }
    it { expect(subject.role).to be_kind_of(String) }
  end
end
