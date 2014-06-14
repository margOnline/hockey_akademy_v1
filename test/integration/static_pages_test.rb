require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Hockey Akademy" do
      visit '/static_pages/home'
      expect(page).to have_content('Hockey Akademy')
    end
  end

  describe "Coaches Profiles page" do

    it "should have the content 'Coaches Profiles" do
      visit '/static_pages/home'
      expect(page).to have_content('Coaches Profiles')
    end
  end
  
end
