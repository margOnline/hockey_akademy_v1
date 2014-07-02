require 'spec_helper'

describe Charge do
  before do
    @charge = FactoryGirl.create(:charge)
  end

  subject { @charge }

  it { should belong_to(:parent) }
  it { should be_valid }
end
