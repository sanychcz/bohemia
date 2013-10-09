require 'spec_helper'

describe Category do

  before { @category = Category.new(name: "category", 
                                    description: "I'm the best category in the world") }

  subject { @category }

  it { should respond_to(:name) }
  it { should respond_to(:description) }

  it { should be_valid } 

  describe "when name is not present" do
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

  describe "when description is not present" do
    before { @category.description = "" }
    it { should_not be_valid }
  end

  describe "when description is present" do
    before { @category.description = "I'm the best category in the world" }
    it { should be_valid }
  end 
end