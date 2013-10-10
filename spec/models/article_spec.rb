require 'spec_helper'

describe Article do

  before { @article = Article.new(title: "title", 
                                  content: "article content") }

  subject { @article }

  it { should respond_to(:title) }
  it { should respond_to(:content) }

  it { should be_valid }

end
