require 'spec_helper'

describe CampRegistration do
  before do
    @params = Hash[:camp_session_id => [1], :player_id => 1]
  end

  it 'should initialize with an argument' do
    CampRegistrationCollection.new(@params).should be_kind_of(CampRegistrationCollection)
  end

  context 'create' do
    before do

    end

    it 'should create one new CampRegistration for one camp_session_id' do
      expect{CampRegistrationCollection.save}.to change{CampRegistration.count}.from(0).to(1)
    end
  end

end
