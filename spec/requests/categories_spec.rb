require 'spec_helper'

describe "Categories" do

  let(:user) { FactoryGirl.create(:user) }
  let(:category) { FactoryGirl.create(:category) }

  before(:each) { sign_in user}

  describe "category creation" do
    before { visit new_category_path }

    describe "with invalid information" do

      it "should not create a category" do
        expect { click_button "Save" }.not_to change(Category, :count)
      end

      describe "error messages" do
        before { click_button "Save" }
        it { should have_content('error') }
      end

      it "has to log in before create a post" do
        logout
        visit new_category_path
        page.should have_title('Sign in')
      end
    end

    describe "with valid information" do

      it "should create a category" do
        fill_in "Name",        with: category.name
        fill_in "Description", with: category.description
        expect { click_button "Save" }.to change(Category, :count).by(1)
        page.should have_content(category.name)
      end
    end
  end

  describe "edit category" do

    it "should update category" do
      new_name = "new category"
      visit edit_category_path(category)
      fill_in "Name", with: new_name
      click_button "Save"
      page.should have_content(new_name)
    end
  end
end