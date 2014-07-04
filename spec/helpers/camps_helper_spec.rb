require 'spec_helper'

describe CampsHelper do
  before do
    @camp = FactoryGirl.create(:camp)
    @cs1 = FactoryGirl.create(:camp_session,
      :camp_id => @camp.id,
      :start_time => Time.new(2014,7,7,9,0,0),
      :end_time => Time.new(2014,7,7,17,0,0,0)
    )
    @cs2 = FactoryGirl.create(:camp_session,
      :camp_id => @camp.id,
      :start_time => Time.new(2014,7,4,9,0,0),
      :end_time => Time.new(2014,7,7,4,16,0,0)
    )
  end

  it 'returns the earliest start date of all a camp\'s camp_sessions' do
    expect(start_date_for(@camp)).to eq @cs2.start_time.strftime('%A, %d %b %Y')
  end

  it 'returns the latest start date of all a camp\'s camp_sessions' do
    expect(end_date_for(@camp)).to eq @cs1.end_time.strftime('%A, %d %b %Y')
  end
end
