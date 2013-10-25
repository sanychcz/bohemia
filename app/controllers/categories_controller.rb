class CategoriesController < ApplicationController
   
  before_action :find_category, only: [:edit, :update, :destroy, :show]
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :new, :create]
  layout :resolve_layout

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
    @category.photos.build
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to "/admin/categories"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @category.update_attributes(category_params)
      redirect_to "/admin/categories"
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    redirect_to "/admin/categories"      
  end

  private

    def find_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :description, :annotation,
                      photos_attributes: [:id,:name,:image, :photoable_id, :photoable_type, :_destroy],
                      documents_attributes: [:id,:name,:doc, :documentable_id, :documentable_type, :_destroy])
    end

    def resolve_layout
      case action_name
      when "new", "create", "edit", "destroy", "update"
        "admin"
      else
        "application"
      end
    end
end
