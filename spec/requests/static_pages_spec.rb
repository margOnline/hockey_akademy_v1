require 'spec_helper'

describe "Static pages" do
  subject { page }
  
  describe "Home page" do
    before { visit root_path }
    it { should have_content('Hockey Akademy') }
    it { should have_title(full_title('')) }
    it { should_not have_title('| Home') }
  end

  describe "Coaches Profiles page" do
    before { visit coach_profiles_path }
    it { should have_content('Coaches Profiles') }
    it { should have_title(full_title('Coaches Profiles')) }
  end
  
end
