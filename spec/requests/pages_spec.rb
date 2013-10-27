require 'spec_helper'

describe "Pages" do

  let(:user){ FactoryGirl.create(:user) }
  let(:article) { FactoryGirl.create(:article) }
  let(:article2) { FactoryGirl.create(:article2) }
  let(:article3) { FactoryGirl.create(:article3) }
  let(:category) { FactoryGirl.create(:category) }
  let(:product) { FactoryGirl.create(:product) }
  let(:product2) { FactoryGirl.create(:product2) }
  let(:product3) { FactoryGirl.create(:product3) }

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

    describe "articles should be on main page" do

      before { FactoryGirl.create(:article) }
      before { FactoryGirl.create(:article2) }
      before { FactoryGirl.create(:article3) }

      it "should have products on main page" do
        visit root_path
        expect(page).to have_content(article.annotation)
        expect(page).to have_content(article2.annotation)
        expect(page).to have_content(article3.annotation)
      end
    end

    describe "products should be on main page" do

      before { FactoryGirl.create(:category) }
      before { FactoryGirl.create(:product,  category: category) }
      before { FactoryGirl.create(:product2, category: category) }
      before { FactoryGirl.create(:product3, category: category) }

      it "should have products on main page" do
        visit root_path
        expect(page).to have_content(product.annotation)
        expect(page).to have_content(product2.annotation)
        expect(page).to have_content(product3.annotation)
      end
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