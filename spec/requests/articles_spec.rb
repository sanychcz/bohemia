require 'spec_helper'

describe "Articles" do
  
  let(:user) { FactoryGirl.create(:user) }
  let(:article) { FactoryGirl.create(:article) }

  before(:each) { sign_in user}

  describe "article creation" do
    before do
     visit new_article_path(locale: "en")
    end

    describe "with invalid information" do

      it "should not create a article" do
        expect { click_button "Save" }.not_to change(Article, :count)
      end

      describe "error messages" do
        before { click_button "Save" }
        it { should have_content('error') }
      end

      it "has to log in before create a article" do
        logout
        visit new_article_path(locale: "en")
        page.should have_title('Sign in')
      end
    end

    describe "with valid information" do

      it "should create a article" do
        fill_in "Title",   with: article.title
        fill_in "Content", with: article.content
        fill_in "Annotation", with: article.annotation
        expect { click_button "Save" }.to change(Article, :count).by(1)
        page.should have_content(article.title)
      end
    end
  end

  describe "edit article" do
    before { FactoryGirl.create(:article) }

    it "should update article" do
      new_title = "new article"
      visit edit_article_path(locale: "en", id: article.id)
      fill_in "Title", with: new_title
      click_button "Save"
      page.should have_content(new_title)
    end
  end

  describe "delete article" do
    before { FactoryGirl.create(:article) }

    it "should delete article" do
      visit "/admin/articles/"
      page.should have_title('Articles')
      expect { first(:link, "delete").click }.to change(Article, :count).by(-1)
      current_path.should == "/admin/articles"
    end
  end
end