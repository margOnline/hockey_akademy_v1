require 'spec_helper'

describe "Static pages" do
  subject { page }

  describe "Home page" do
    before do
      @early_camp = FactoryGirl.create(:camp)
      @later_camp = FactoryGirl.create(:camp, :name => "Pre Season Training")
      @cs = FactoryGirl.create(:camp_session,
        :camp => @early_camp,
        :start_time => Time.new(2014,7,10,10,0,0),
        :end_time => Time.new(2014,7,10,16,0,0)
      )
      visit root_path
    end

    it { should have_content('Hockey Akademy') }
    it { should have_title(full_title('')) }
    it { should have_content(@early_camp.name)}
    it { should_not have_title('| Home') }
  end

  describe "Coaches Profiles page" do
    before { visit coach_profiles_path }
    it { should have_content('Coaches Profiles') }
    it { should have_title(full_title('Coaches Profiles')) }
  end

end
