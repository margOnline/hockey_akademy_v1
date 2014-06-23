require 'spec_helper'

describe Parent do
  before do
    @parent = FactoryGirl.create(:parent)
  end

  subject { @parent }

  it { should have_many(:players) }
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }
  it { should respond_to(:mobile_number) }
  it { should respond_to(:home_phone_number) }
  it { should be_valid }

  it 'should not be valid without a phone number' do
    @parent.mobile_number = ""
    @parent.should_not be_valid
  end

  it 'should display a full name' do
    @parent.save
    expect(@parent.full_name).to eq 'John Doe'
  end


end
