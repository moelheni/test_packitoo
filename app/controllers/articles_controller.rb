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
    @article = Article.new
  end

  # POST /articles
  def create
    # create object from POST params
    @article = Article.new(article_params)

    # validate & save object to DB
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
