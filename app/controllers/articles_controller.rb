class ArticlesController < ApplicationController
  # GET /articles
  def index
    @articles = Article.all
  end
  
  # GET /articles/:id
  def show
    @article = Article.find(params[:id])
  end

  # GET /articles/new
  def new
  end

  # POST /articles
  def create
    # create object from POST params
    @article = Article.new(article_params)
    # save object to DB
    @article.save
    # redirect to the created article url
    redirect_to @article
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
