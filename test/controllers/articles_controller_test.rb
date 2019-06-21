require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test 'should show error message when no title' do
    text = 'Rails is awesome!'
    post articles_url, params: { article: { text: text, title: '' } }, headers: headers
    assert_match "Title can&#39;t be blank", response.body
  end

  private
    def headers
      { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials('dhh', 'secret') }
    end
end
