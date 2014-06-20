require 'spec_helper'

describe Parent do
  before do
    @parent = Parent.new(
      first_name: 'John',
      last_name: 'Doe',
      email: 'John@gmail.com',
      password: 'password',
      relation_to_player: 'parent',
      mobile_number: '0774123456'
    )
  end

  subject { @parent }

  it { should have_many(:players) }
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }
  it { should respond_to(:mobile_number) }
  it { should respond_to(:home_phone_number) }
  it { should respond_to(:relation_to_player) }
  it { should be_valid }

  it 'should not be valid with a phone number' do
    @parent.mobile_number = ""
    @parent.should_not be_valid
  end

end
