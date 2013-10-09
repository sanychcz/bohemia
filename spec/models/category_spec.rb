require 'spec_helper'

describe Category do

  before { @category = Category.new(name: "category") }

  subject { @category }

  it { should respond_to(:name) }

  it { should be_valid } 

  describe "when name is empty" do
    before { @category.name = "" }
    it { should_not be_valid }
  end

  describe "when name is 'nil'" do
    before { @category.name = nil }
    it { should_not be_valid }
  end

  describe "when name is present" do
    before { @category.name = "sosiska" }
    it { should be_valid }
  end 
end
