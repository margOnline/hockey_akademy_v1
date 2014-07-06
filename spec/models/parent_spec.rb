require 'spec_helper'

describe Parent do
  before do
    @parent = FactoryGirl.create(:parent)
  end

  subject { @parent }

  it { should have_many(:players) }
  it { should have_many(:camp_registrations)}
  it { should have_many(:charges)}
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }
  it { should respond_to(:mobile_number) }
  it { should respond_to(:home_phone_number) }
  it { should be_valid }

  it 'is not valid without a phone number' do
    @parent.mobile_number = ""
    @parent.should_not be_valid
  end

  it 'displays a full name' do
    @parent.save
    expect(@parent.full_name).to eq 'John Doe'
  end

  it 'returns a total price for its camp registrations' do
    cr1 = FactoryGirl.create(:camp_registration, :parent => @parent)
    cr2 = FactoryGirl.create(:camp_registration, :parent => @parent)
    expect(@parent.camp_registrations.count).to eq 2
    expect(@parent.camp_registrations_total_price).to eq 60.0
  end

end
