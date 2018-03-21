class SentimentsController < ApplicationController
  before_action :set_sentiment, only: [:show, :update, :destroy]

  # GET /region/1/sentiments
  def index
    @sentiment = Region.find(params[:region_id]).sentiments.last(10)
    render json: @sentiment
  end

  # GET /sentiments/1
  def show
    render json: @sentiment
  end

  # POST /sentiments
  def create
    @sentiment = Sentiment.create(sentiment_params)
    if @sentiment.save
      render json: @sentiment, status: :created
    else
      render json: @sentiment.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sentiment
      @sentiment = Sentiment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sentiment_params
      params.require(:sentiment).permit(:score, :region_id)
    end
end
