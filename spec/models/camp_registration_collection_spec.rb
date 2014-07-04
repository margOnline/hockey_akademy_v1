require 'spec_helper'

describe CampRegistration do
  before do
    @parent = FactoryGirl.create(:parent)
    @params = {:player_id => 1, :camp_session_id => [1]}
  end

  context 'validations' do
    context 'pass' do
      it "with a parent (using 0)" do
        CampRegistrationCollection.new(@parent, @params).should have(0).
          errors_on(:parent)
      end
    end

    context 'fail' do
      it "without a parent (using error_on)" do
        CampRegistrationCollection.new(:parent => nil, :params => @params).
          should have(1).error_on(:parent)
      end

      context 'without a player id' do
        params = {:player_id => '', :camp_session_id => [1]}
        subject { @crc = CampRegistrationCollection.new(1, params)}
        it { should_not be_valid }
      end

      context 'without camp_session_ids' do
        params = {:player_id => 1, :camp_session_id => []}
        subject { @crc = CampRegistrationCollection.new(1, params)}
        it { should_not be_valid }
      end
    end
  end

  context 'create' do

    it 'should create one new CampRegistration for one camp_session_id' do
      crc = CampRegistrationCollection.new(@parent, @params)
      expect { crc.save }.to change { CampRegistration.count }.by(1)
    end

    it 'should create 3 new CampRegistration for 3 camp_session_ids' do
      @params = {:player_id => 1, :camp_session_id => [1,2,3]}
      crc = CampRegistrationCollection.new(@parent, @params)
      expect { crc.save }.to change { CampRegistration.count }.by(3)
    end
  end

end
