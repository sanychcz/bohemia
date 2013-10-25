class PagesController < ApplicationController

  layout "application"

  def home
    @categories = Category.includes( :photos).to_a 
    @articles = Article.recent.includes(:photos).to_a
    @products = Product.recent_products.includes(:photos).to_a
  end

  def contact
  end

  def about
  end

  def download
    @documents = Document.all
  end
end
