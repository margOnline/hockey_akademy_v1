require 'spec_helper'

describe Basket do
  before do
    @basket = FactoryGirl.create(:basket)
  end

  context 'validations' do
    subject { @basket }

    it { should belong_to(:parent) }
    it { should have_many(:camp_registrations) }
    it { should respond_to(:parent) }
    it { should be_valid }

    it 'has a price that is not negative' do
      price = 0
      expect(price).not_to be < 0
    end
  end

  context 'price' do
    it 'should equal the sum of all the camp_registrations' do

    end
  end
end
