require 'spec_helper'

describe "Pages" do

  let(:user){ FactoryGirl.create(:user) }
  
  describe "Home page" do
    it "should have the title 'Home'" do
      visit '/'
      expect(page).to have_title('Home')
    end

    it "should have 'Download id' selector" do
      visit '/'
      expect(page).to have_css("section#download")
    end

    it "should not have 'logout' and 'admin' links for not sign in user" do
      visit '/'
      expect(page).not_to have_link('logout')
      expect(page).not_to have_link('admin')
    end

    it "should have 'logout' and 'admin' links for sign in user" do
      sign_in user
      visit '/'
      expect(page).to have_link('logout')
      expect(page).to have_link('admin')
    end

    it "should not have 'home' link for sign in user when on home page" do
      sign_in user
      visit '/'
      expect(page).not_to have_link('home')
    end
  end

  describe "About page" do
    it "should have the title 'About'" do
      visit '/about'
      expect(page).to have_title('About')
    end

    it "should not have 'Download id' selector" do
      visit '/about'
      expect(page).not_to have_css("section#download")
    end
  end

  describe "Contact page" do
    it "should have the title 'Contact'" do
      visit '/contact'
      expect(page).to have_title('Contact')
    end

    it "should not have 'Download id' selector" do
      visit '/contact'
      expect(page).not_to have_css("section#download")
    end
  end
end
