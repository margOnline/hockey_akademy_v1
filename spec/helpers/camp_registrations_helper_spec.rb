# encoding: UTF-8
require 'spec_helper'

describe CampRegistrationsHelper do
  before do
    @crs = [FactoryGirl.create(:camp_registration)]
  end
  describe "total" do
    it "returns the total of camp session prices formatted as a currency" do
      helper.total(@crs).should eq "£30.00"
    end
  end
end
