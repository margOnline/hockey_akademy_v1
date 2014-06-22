require 'spec_helper'

describe CampSession do
  before do
    @campSession = CampSession.new(
      title: 'Penalties',
      description: 'ipsem lorem de facto'
    )
  end

  subject { @campSession }

  it { should belong_to(:camp) }
  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should be_valid }
end
