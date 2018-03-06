class SentimentsController < ApplicationController
  before_action :set_sentiment, only: [:show, :update, :destroy]

  # GET /sentiments
  def index
    @sentiments = Sentiment.all

    render json: @sentiments
  end

  # GET /sentiments/1
  def show
    render json: @sentiment
  end

  # POST /sentiments
  def create
    unless sentiment_params[:region_id]
      @region = Region.find_by_name(sentiment_params[:region_name])
    end

    @sentiment = Sentiment.new(sentiment_params)

    if @sentiment.save
      render json: @sentiment, status: :created, location: @sentiment
    else
      render json: @sentiment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sentiments/1
  def update
    if @sentiment.update(sentiment_params)
      render json: @sentiment
    else
      render json: @sentiment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sentiments/1
  def destroy
    @sentiment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sentiment
      @sentiment = Sentiment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sentiment_params
      params.require(:sentiment).permit(:score, :region_id, :region_name)
    end
end
