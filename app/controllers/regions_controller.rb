class RegionsController < ApplicationController
  def index
    render json: Region.all, status: status
  end

  def create
    @region = Region.create!(region_params)
    render json: @region, status: status
  end

  private

  def region_params
    params.permit(:name, :latitude, :longitude)
  end
end
