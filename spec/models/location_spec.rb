require 'spec_helper'

describe Location do
  before do
    @location = FactoryGirl.create(:location)
  end

  subject { @location }

  it { should belong_to(:camp) }
  it { should respond_to(:name) }
  it { should be_valid }

end
