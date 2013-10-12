require 'spec_helper'

describe Article do

  before { @article = Article.new(title: "title", 
                                  content: "article content") }

  subject { @article }

  it { should respond_to(:title) }
  it { should respond_to(:content) }

  it { should be_valid }

  describe "when title is not present" do
    before { @article.title = "" }
    it { should_not be_valid }
  end

  describe "when content is not present" do
    before { @article.content = "" }
    it { should_not be_valid }
  end

end
