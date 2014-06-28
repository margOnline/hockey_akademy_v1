# encoding: UTF-8
require 'spec_helper'

describe CampRegistrationsHelper do
  before do
    @cr = FactoryGirl.create(:camp_registration)
  end
  describe "total" do
    it "returns the total of camp session prices formatted as a currency" do
      helper.total(@cr).should eq "£30.00"
    end
  end
end
