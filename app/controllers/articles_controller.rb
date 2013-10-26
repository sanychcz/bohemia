class ArticlesController < ApplicationController

  before_action :find_article, only: [:edit, :update, :destroy ]
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :new, :create]
  layout :resolve_layout

  def index
    @articles = Article.includes(:photos).order("created_at DESC").page(params[:page]).per(4)
  end

  def show
    @article = Article.includes(:photos).find(params[:id])
  end

  def new
    @article = Article.new
    @article.photos.build
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to "/admin/articles"
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @article.update_attributes(article_params)
      redirect_to "/admin/articles"
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to "/admin/articles"
  end

  private

    def find_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :annotation, :content, 
                      photos_attributes: [:id,:name,:image, :photoable_id, :photoable_type, :_destroy] )
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
