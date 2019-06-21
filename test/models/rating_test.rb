require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  test 'calculate average of rating' do
    article = Article.create title: 'MOCK ARTICLE'
    article.ratings.create(score: 2)
    article.ratings.create(score: 5)
    assert_equal 3.5, article.avg_rating
  end
end
