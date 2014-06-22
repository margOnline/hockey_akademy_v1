require 'spec_helper'

describe Standard do
    before do
    @standard = Standard.new(
      level: 'Cub'
    )
  end

  subject { @standard }

  it { should respond_to(:level) }
  it { should have_many(:players)}
  it { should be_valid }
end
