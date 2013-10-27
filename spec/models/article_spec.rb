require 'spec_helper'

describe Article do

  before { @article = Article.new(title: "title", 
                                  content: "article content",
                                  annotation: "article annotation" ) }

  subject { @article }

  it { should respond_to(:title) }
  it { should respond_to(:content) }
  it { should respond_to(:annotation) }

  it { should be_valid }

  describe "when title is not present" do
    before { @article.title = "" }
    it { should_not be_valid }
  end

  describe "when content is not present" do
    before { @article.content = "" }
    it { should_not be_valid }
  end

  describe "when annotation is not present" do
    before { @article.annotation = "" }
    it { should_not be_valid }
  end

  describe "annotation should have max 160 chars" do
    before { @article.annotation = "a" * 161 }
    it { should_not be_valid }
  end
end
