require 'spec_helper'

describe Admin do
  before do
    @admin = FactoryGirl.create(:admin)
  end

  subject { @admin }

  it { should respond_to(:email) }
  it { should respond_to(:password) }

  it { should be_valid }


end
