class PagesController < ApplicationController

  def home
    @categories = Category.all
  end

  def contact
  end

  def about
  end

  def download
  end
end
