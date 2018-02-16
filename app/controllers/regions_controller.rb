class RegionsController < ApplicationController
  def create
    @region = Region.create!(region_params)
    render json: @region, status: status
  end

  private

  def region_params
    params.permit(:name, :latitude, :longitude) 
  end
end
