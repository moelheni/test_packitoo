class RatingsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @rating = @article.ratings.new(rating_params)
    if @rating.save
      puts 'ok'
      redirect_to articles_path
    else
      redirect_to articles_path, flash: {rating_errors: @rating.errors}
    end
  end

  private
    def rating_params
      params.require(:rating).permit(:score)
    end
end
