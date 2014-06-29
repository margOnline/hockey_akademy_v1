require 'spec_helper'

describe CampRegistration do
  before do
    @params = Hash[:player_id, 1, :cs_ids, [1]]
    @crc = CampRegistrationCollection.new(@params,1)
  end

  context 'validations' do
    context 'should be valid' do
      subject { @crc }

      it {should validate_numericality_of(:parent_id)}
      it {should be_valid}
    end
  end

    context 'should not be valid' do
      context 'without a parent id' do
        subject { @crc = CampRegistrationCollection.new(@params,'')}
        it { should_not be_valid }
      end

      context 'without a player id' do
        @params = Hash[:player_id, '', :cs_ids, [1]]
        subject { @crc = CampRegistrationCollection.new('',1)}
        it { should_not be_valid }
      end

      context 'without camp_session_ids' do
        @params = Hash[:player_id, 1, :cs_ids, []]
        subject { @crc = CampRegistrationCollection.new(@params,1)}
        it { should_not be_valid }
      end
    end

  context 'create' do

    it 'should create one new CampRegistration for one camp_session_id' do
      crc = CampRegistrationCollection.new(@params,1)
      expect(crc.save!).to change(CampRegistration.count).by(1)
    end

    it 'should create 3 new CampRegistration for 3 camp_session_ids' do
      @params = Hash[:player_id, 1, :cs_ids, [1,2,3]]
      crc = CampRegistrationCollection.new(@params,1)
      expect(crc.save!).to change(CampRegistration.count).by(3)
    end
  end

end
