require 'test_helper'

class RatingControllerTest < ActionDispatch::IntegrationTest
  test 'should average ratings' do
    article = Article.create title: 'MOCK ARTICLE', text: 'text'
    post article_ratings_path(article), params: { rating: { score: 3 } }
    post article_ratings_path(article), params: { rating: { score: 5 } }
    assert_equal 4, article.avg_rating
  end
end
