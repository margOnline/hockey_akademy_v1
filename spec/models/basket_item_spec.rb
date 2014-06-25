require 'spec_helper'

describe BasketItem do
  before do
    @basket_item = FactoryGirl.create(:basket_item)
  end

  subject { @basket_item }

  it { should belong_to(:basket) }
  it { should respond_to(:basket) }
  it { should be_valid }
end
