class CategoriesController < ApplicationController
   
  before_action :find_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category
      flash[:success] = "Success"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @category.update_attributes(category_params)
      redirect_to "/admin/caegories"
      flash[:success] = "Success"
    else
      flash.now[:error] = 'Unsuccsessful'
      render 'edit'
    end
  end

  def destroy
    if @category.destroy
      redirect_to "/admin/categories"
    end
  end

  private

    def find_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
