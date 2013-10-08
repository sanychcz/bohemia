require 'spec_helper'

describe Category do

  before { @category = Category.new(name: "category") }

  subject { @category }

  it { should respond_to(:name) }

  it { should be_valid } 
end
