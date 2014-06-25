require 'spec_helper'

describe Basket do
  before do
    @basket = FactoryGirl.create(:basket)
  end

  subject { @basket }

  it { should belong_to(:parent) }
  it { should have_many(:line_items)}
  it { should respond_to(:parent)}
  it { should be_valid }
end
