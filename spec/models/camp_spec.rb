require 'spec_helper'

describe Camp do
  before do
    @camp = FactoryGirl.create(:camp)
    @camp_session = FactoryGirl.create(:camp_session, :camp_id => @camp.id)
  end

  subject { @camp }

  it { should have_many(:camp_sessions) }
  it { should belong_to(:location) }
  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:num_of_attendees) }
  it { should be_valid }

  context 'start date' do
    it 'returns the start time for the camp' do
      expect(@camp.start_time).to eq Time.new(2014,7,11,10,0,0)
    end
  end

  context 'end date' do
    it 'returns the end time for the camp' do
      expect(@camp.end_time).to eq Time.new(2014,7,11,16,0,0)
    end
  end
end
