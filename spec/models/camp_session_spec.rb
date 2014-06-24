require 'spec_helper'

describe CampSession do
  before do
    @campSession = FactoryGirl.create(:campSession)
  end

  subject { @campSession }

  it { should belong_to(:camp) }
  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:start_time) }
  it { should respond_to(:end_time) }
  it { should be_valid }
end
