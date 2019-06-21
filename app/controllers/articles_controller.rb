class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  # GET /articles
  def index
    @articles = Article.all
    @rating = Rating.new

    respond_to do |format|
      format.html
      format.csv { send_data @articles.to_csv, filename: "articles-#{Date.today}.csv" }
    end
  end

  # GET /articles/:id
  def show
    @article = Article.find(params[:id])
  end

  # GET /articles/:id/edit
  def edit
    @article = Article.find(params[:id])
  end

  # PUT /articles/:id
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
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

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
