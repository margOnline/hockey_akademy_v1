require 'spec_helper'

describe Camp do
  before do
    @camp = FactoryGirl.create(:camp)
  end

  subject { @camp }

  it { should have_many(:campSessions) }
  it { should belong_to(:location) }
  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:num_of_attendees) }
  it { should be_valid }

end
