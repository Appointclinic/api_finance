require 'rails_helper'

RSpec.describe CompanyUnity, type: :model do
  describe "On create" do
    it { should validate_presence_of :name }
  end
end
