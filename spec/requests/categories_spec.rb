require 'spec_helper'

describe "Categories" do

  let(:user) { FactoryGirl.create(:user) }
  let(:category) { FactoryGirl.create(:category) }

  before(:each) { sign_in user}

  describe "category creation" do
    before do      
      visit new_category_path(locale: "en") 
    end

    describe "with invalid information" do

      it "should not create a category" do
        expect { click_button "Save" }.not_to change(Category, :count)
      end

      describe "error messages" do
        before { click_button "Save" }
        it { should have_content('error') }
      end

      it "has to log in before create a category" do
        logout
        visit new_category_path(locale: "en")
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
    before { FactoryGirl.create(:category) }

    it "should update category" do
      new_name = "new category"
      visit edit_category_path(locale: "en", id: category.id)
      fill_in "Name", with: new_name
      click_button "Save"
      page.should have_content(new_name)
    end
  end

  describe "delete category" do
    before { FactoryGirl.create(:category) }
    before { FactoryGirl.create(:product, category: category)}
    before { FactoryGirl.create(:product, category: category)}

    it "should delete category" do
      visit "/admin/categories/"
      page.should have_title('Categories')
      expect { first(:link, "delete").click }.to change(Category, :count).by(-1)
      current_path.should == "/admin/categories"
    end

    it "should destroy associated products" do
      products = category.products.to_a
      category.destroy
      expect(products).not_to be_empty
      products.each do |product|
        expect(Product.where(id: product.id)).to be_empty
      end
    end
  end
end