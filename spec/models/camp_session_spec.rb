require 'spec_helper'

describe CampSession do
  before do
    @camp_session = FactoryGirl.create(:camp_session)
  end

  subject { @camp_session }

  it { should belong_to(:camp) }
  it { should have_many(:registrations) }
  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:start_time) }
  it { should respond_to(:end_time) }
  it { should respond_to(:price) }
  it { should be_valid }


  it 'should return the session with the earliest starting time' do
    @earlier_cs = FactoryGirl.create(:camp_session, :start_time => Time.new(2014,6,30,9,0,0))
    expect(CampSession.earliest).to eq @earlier_cs
  end

  context 'display name' do
    it 'should include the start date' do
      expect(@camp_session.title_with_start_date).to eq 'Goalkeeping - Friday, 11 Jul 2014'
    end
  end
end
