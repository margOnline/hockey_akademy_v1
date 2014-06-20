require 'spec_helper'

describe Player do
  before do
    @player = Player.new(
      first_name: 'Johnnie',
      last_name: 'Doe',
      gender: 'male',
      experience: 'cub',
      dob: Time.new(2002,1,1),
      club: 'Surrey'
    )
  end

  subject { @player }

  it { should belong_to(:parent) }
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:gender) }
  it { should respond_to(:dob) }
  it { should respond_to(:experience) }
  it { should respond_to(:club) }
  it { should respond_to(:allergies) }
  it { should respond_to(:medical) }
  it { should be_valid }

end
