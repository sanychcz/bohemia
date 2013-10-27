require 'spec_helper'

describe "Products" do
  
  let(:user) { FactoryGirl.create(:user) }
  let(:category) { FactoryGirl.create(:category) }
  let(:product) { FactoryGirl.create(:product) }

  before(:each) { sign_in user}

  describe "product creation" do
  	before { FactoryGirl.create(:category) }
    before do 
      visit new_product_path(locale: "en") 
    end

    describe "with invalid information" do

      it "should not create a product" do
        expect { click_button "Save" }.not_to change(Product, :count)
      end

      describe "error messages" do
        before { click_button "Save" }
        it { should have_content('error') }
      end

      it "has to log in before create a product" do
        logout
        visit new_product_path(locale: "en")
        page.should have_title('Sign in')
      end
    end

    describe "with valid information" do
    	
      it "should create a product" do
      	select  category.name, :from => "product_category_id"
        fill_in "Name",        with: product.name
        fill_in "Description", with: product.description
        fill_in "Features",    with: product.features
        fill_in "Annotation",  with: product.annotation
        expect { click_button "Save" }.to change(Product, :count).by(1)
        page.should have_content(product.name)
      end
    end
  end

  describe "edit product" do
    before { FactoryGirl.create(:product) }

    it "should update product" do
      new_name = "new product"
      new_description = "description"
      visit edit_product_path(locale: "en", id: product.id)
      fill_in "Name", with: new_name
      fill_in "Description", with: new_description
      click_button "Save"
      page.should have_content(new_name)
    end
  end

  describe "delete product" do
    before { FactoryGirl.create(:category) }
    before { FactoryGirl.create(:product, category: category)}

    it "should delete product" do
      visit "/admin/products/"
      page.should have_title('Products')
      expect { first(:link, "delete").click }.to change(Product, :count).by(-1)
      current_path.should == "/admin/products"
    end
  end
end
