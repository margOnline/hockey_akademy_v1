require 'spec_helper'

describe Player do
  before do
    @parent = Parent.new(
      first_name: 'John',
      last_name: 'Doe',
      email: 'John@gmail.com',
      password: 'password',
      mobile_number: '0774123456'
    )
    @standard = Standard.new(:level => 'cub')
    @player = Player.new(
      first_name: 'Johnnie',
      last_name: 'Doe',
      gender: 'male',
      standard: @standard,
      dob: Time.new(2002,1,1),
      club: 'Surrey',
      parent: @parent
    )
  end

  subject { @player }

  it { should belong_to(:parent) }
  it { should belong_to(:standard) }
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:gender) }
  it { should respond_to(:dob) }
  it { should respond_to(:club) }
  it { should respond_to(:allergies) }
  it { should respond_to(:medical) }
  it { should respond_to(:parent)}
  it { should be_valid }

end
