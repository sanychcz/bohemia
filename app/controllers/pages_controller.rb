class PagesController < ApplicationController

  def home
    @categories = Category.all 
    @articles = Article.recent
    @products = Product.recent_products
  end

  def contact
  end

  def about
  end

  def download
  end
end
