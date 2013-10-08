class AdminController < ApplicationController
  
  before_action :authenticate_user!
  layout "admin"

  def admin_index
    @users = User.all
    @categories = Category.all
  end

  def admin_categories
    @categories = Category.all
  end

  def admin_products
  end
end
