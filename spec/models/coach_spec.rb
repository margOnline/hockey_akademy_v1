require 'spec_helper'

describe Coach do
  before do
    @coach = FactoryGirl.create(:coach)
  end
  subject { @coach }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:bio) }
  it { should respond_to(:gravatar) }

  it { should be_valid }

  it 'should display the fullname' do
    @coach.save
    expect(@coach.fullname).to eq("Alex Ferguson")
  end
end
