require 'spec_helper'

describe Registration do
  before do
    @registration = FactoryGirl.create(:registration)
  end
   subject { @registration }

  it { should belong_to(:player) }
  it { should belong_to(:camp_session)}
end
