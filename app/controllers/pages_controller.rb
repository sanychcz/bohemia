class PagesController < ApplicationController

  def home
    @categories = Category.all 
    @articles = Article.recent
    @products = Product.all
  end

  def contact
  end

  def about
  end

  def download
  end
end
