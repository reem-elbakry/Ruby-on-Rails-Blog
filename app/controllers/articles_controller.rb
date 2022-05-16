#no need to require ApplicationController (autoloading)
class ArticlesController < ApplicationController


  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    #instance var (any instance method can access it) .. private
    @articles = Article.all
    #no need to send articles to the view
  end

  def show
  end

  def new
    #empty obj from model to new view 
    @article = Article.new   
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit
    #send exist obj >> form_with >> edit 
  end

  def update

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :status)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
