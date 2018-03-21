require 'test_helper'

class SentimentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sentiment = sentiments(:cranky_haight)
    @region = regions(:haight_ashbury)
  end

  test "should get index" do
    get region_sentiments_url([@region]), as: :json
    assert_response :success
  end

  test "should create sentiment" do

    assert_difference('Sentiment.count') do
      post region_sentiments_url([@region]), params: { sentiment: { region_id: 77, score: 1 } }, as: :json
    end

    assert_response 201
  end
end
