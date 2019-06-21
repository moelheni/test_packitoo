require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test 'body sould be saved' do
    article = Article.create title: 'MOCK ARTICLE', text: 'text'
    last_article = Article.all.last
    assert_equal 'text', last_article.text
  end
end
