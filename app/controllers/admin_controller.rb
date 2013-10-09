class AdminController < ApplicationController
  
  before_action :authenticate_user!
  layout "admin"

  def admin_home
    @users = User.all
    @categories = Category.all
  end

  def admin_categories
    @categories = Category.all
  end

  def admin_products
    @products = Product.all
  end
end
