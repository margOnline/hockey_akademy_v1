require 'spec_helper'
include Devise::TestHelpers

describe CampRegistration do
  before do
    @camp_registration = FactoryGirl.create(:camp_registration)
  end
   subject { @camp_registration }

  it { should belong_to(:player) }
  it { should belong_to(:camp_session)}
  it { should belong_to(:parent)}
  it { should be_valid }

  context 'scopes' do
    before do
      @parent1 = FactoryGirl.create(:parent)
      @parent2 = FactoryGirl.create(:parent)
      @cr_for_parent1 = FactoryGirl.create(:camp_registration, :parent => @parent1 )
      @cr_for_parent2 = FactoryGirl.create(:camp_registration, :parent => @parent2 )
    end

    it 'returns all camp registrations for a specific parent' do
      expect(CampRegistration.for_parent(@parent1)).to eq [@cr_for_parent1]
      expect(CampRegistration.for_parent(@parent1)).to_not eq [@cr_for_parent2]
    end
  end
end
