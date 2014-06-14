require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Hockey Akademy" do
      visit '/'
      expect(page).to have_content('Hockey Akademy')
    end

    it "should have the title 'Home'" do
      visit '/'
      expect(page).to have_title('Hockey Akademy | Home')
    end
  end

  describe "Coaches Profiles page" do

    it "should have the content 'Coaches Profiles'" do
      visit '/coach_profiles'
      expect(page).to have_content('Coaches Profiles')
    end

    it "should have the title 'Coaches Profiles'" do
      visit '/coach_profiles'
      expect(page).to have_title('Hockey Akademy | Coaches Profiles')
    end
  end
  
end
