require 'spec_helper'

describe Product do
  
  before { @product = Product.new(name: "product", description: "Nice product", 
  								  features: "nice features") }

  subject { @product }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:features) }
  it { should respond_to(:category_id) }

  it { should be_valid }

end
