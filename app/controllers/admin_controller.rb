class AdminController < ApplicationController
  
  before_action :authenticate_user!
  layout "admin"

  def admin_home
  end

  def admin_categories
    @categories = Category.includes(:documents, :photos).to_a
  end

  def admin_products
    @products = Product.includes(:documents, :photos).to_a
  end

  def admin_articles
    @articles = Article.includes(:photos).to_a
  end
end
