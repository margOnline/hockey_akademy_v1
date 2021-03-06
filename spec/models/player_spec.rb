require 'spec_helper'

describe Player do
  before do
    @parent = FactoryGirl.create(:parent)
    @standard = FactoryGirl.create(:standard)
    @player = FactoryGirl.create(:player)
  end

  subject { @player }

  it { should belong_to(:parent) }
  it { should belong_to(:standard) }
  it { should have_many(:camp_registrations)}
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:gender) }
  it { should respond_to(:dob) }
  it { should respond_to(:club) }
  it { should respond_to(:allergies) }
  it { should respond_to(:medical) }
  it { should respond_to(:parent)}
  it { should be_valid }

  it 'should display a full name' do
    @player.save
    expect(@player.full_name).to eq 'Junior Doe'
  end

end
