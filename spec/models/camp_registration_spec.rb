require 'spec_helper'

describe CampRegistration do
  before do
    @camp_registration = FactoryGirl.create(:camp_registration)
  end
   subject { @camp_registration }

  it { should belong_to(:player) }
  it { should belong_to(:camp_session) }
  it { should belong_to(:parent) }
  it { should be_valid }
end
