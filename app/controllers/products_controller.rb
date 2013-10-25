class ProductsController < ApplicationController
  
  before_action :find_product, only: [:edit, :update, :destroy, :show]
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :new, :create]
  layout :resolve_layout

  def index
    @products = Product.all
  end

  def show
  end

  def new    
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to "/admin/products"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @product.update_attributes(product_params)
      redirect_to "/admin/products"
    else
      render 'edit'
    end
  end

  def destroy
    @product.destroy
    redirect_to "/admin/products"
  end

  private

    def product_params
      params.require(:product).permit(:name, :description, :annotation, :features, :category_id, 
                      photos_attributes: [:id,:name,:image, :main, :photoable_id, :photoable_type, :_destroy],
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

    def find_product
      @product = Product.find(params[:id])
    end
end
