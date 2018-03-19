class RegionsController < ApplicationController
  before_action :set_region, only: [:show]

  def index
    render json: Region.all, status: status
  end

  def create
    @region = Region.create!(region_params)
    render json: @region, status: status
  end

  def show
    puts @region.sentiments
    render json: @region
  end

  def search
    @region = Region.find_by_name(params[:name])
    render json: @region
  end

  private

  def set_region
    @region = Region.find(params[:id])
  end

  def region_params
    params.permit(:name, :latitude, :longitude)
  end
end
