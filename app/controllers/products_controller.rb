class ProductsController < ApplicationController
  
  layout :resolve_layout

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
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
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      redirect_to "/admin/products"
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to "/admin/products"
    end
  end

  private

    def product_params
      params.require(:product).permit(:name, :description, :features, :category_ids)
    end

    def resolve_layout
      case action_name
      when "new", "create", "edit"
        "admin"
      else
        "application"
      end
    end
end
