require 'spec_helper'

describe Camp do
  before do
    @camp = Camp.new(
      name: 'Penalty flicks',
      description: 'ipsem lorem'
    )
  end

  subject { @camp }

  it { should have_many(:sessions) }
  it { should have_one(:location) }
  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should be_valid }

end
