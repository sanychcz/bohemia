require 'spec_helper'

describe Product do
  
  let(:category) { FactoryGirl.create(:category) }
  before { @product = category.products.build(name: "product", description: "Nice product", 
  								                            features: "nice features",
                                              annotation: "product annotation" ) }

  subject { @product }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:features) }
  it { should respond_to(:category_id) }
  it { should respond_to(:annotation) }

  it { should be_valid }

  describe "when name is not present" do
    before { @product.name = " " }
    it { should_not be_valid }
  end

  describe "when description is not present" do
    before { @product.description = " " }
    it { should_not be_valid }
  end

  describe "when features is not present" do
    before { @product.features = " " }
    it { should_not be_valid }
  end

  describe "when category_id is not present" do
    before { @product.category_id = " " }
    it { should_not be_valid }
  end

  describe "when annotation is not present" do
    before { @product.annotation = " " }
    it { should_not be_valid }
  end

  describe "annotation should have max 250 chars" do
    before { @product.annotation = "a" * 251 }
    it { should_not be_valid }
  end
end
