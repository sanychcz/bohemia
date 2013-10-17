class PagesController < ApplicationController

  def home
    @categories = Category.all 
    @articles = Article.all
    @products = Product.all
  end

  def contact
  end

  def about
  end

  def download
  end
end
